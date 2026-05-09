; DESCRIPTION: Composite: Renders a cyan line between points (59, 44) and (68, 21) then Places a blue 66x47 rectangle at position (225, 147) then Sets a single yellow pixel at (314, 219).
; PLAN: r0=59(x1), r1=44(y1), r2=68(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=147(y), r7=66(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x), r11=219(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 44
LDI r2, 68
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 147
LDI r7, 66
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 219
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
