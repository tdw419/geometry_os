; DESCRIPTION: Composite: Draws a black line from (117, 219) to (310, 123) then Creates a magenta circular shape at (446, 189) with radius 60 then Sets a single red pixel at (454, 154).
; PLAN: r0=117(x1), r1=219(y1), r2=310(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=189(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=454(x), r11=154(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 219
LDI r2, 310
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 189
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 454
LDI r11, 154
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
