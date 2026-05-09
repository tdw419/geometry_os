; DESCRIPTION: Composite: Places a blue line segment connecting (188, 56) to (467, 25) then Places a magenta circle of radius 70 at center (280, 94) then Sets a single blue pixel at (149, 74).
; PLAN: r0=188(x1), r1=56(y1), r2=467(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=94(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=74(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 188
LDI r1, 56
LDI r2, 467
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 94
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 74
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
