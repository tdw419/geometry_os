; DESCRIPTION: Composite: Places a purple 92x89 rectangle at position (420, 20) then Renders a yellow line between points (458, 37) and (122, 74) then Sets a single purple pixel at (181, 161).
; PLAN: r0=420(x), r1=20(y), r2=92(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x1), r6=37(y1), r7=122(x2), r8=74(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=181(x), r11=161(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 20
LDI r2, 92
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 37
LDI r7, 122
LDI r8, 74
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 161
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
