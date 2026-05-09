; DESCRIPTION: Composite: Places a yellow line segment connecting (206, 14) to (99, 226) then Sets a single orange pixel at (57, 23) then Places a magenta circle of radius 11 at center (164, 121).
; PLAN: r0=206(x1), r1=14(y1), r2=99(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=164(x), r11=121(y), r12=11(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 14
LDI r2, 99
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 164
LDI r11, 121
LDI r12, 11
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
