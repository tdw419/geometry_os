; DESCRIPTION: Composite: Renders a yellow line between points (131, 250) and (155, 212) then Places a green 78x45 rectangle at position (280, 47) then Sets a single blue pixel at (78, 211).
; PLAN: r0=131(x1), r1=250(y1), r2=155(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=47(y), r7=78(width), r8=45(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x), r11=211(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 250
LDI r2, 155
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 47
LDI r7, 78
LDI r8, 45
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 211
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
