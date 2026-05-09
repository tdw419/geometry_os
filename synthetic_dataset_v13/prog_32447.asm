; DESCRIPTION: Composite: Draws a magenta line from (256, 254) to (485, 183) then Creates a white circular shape at (319, 92) with radius 80 then Sets a single orange pixel at (262, 181).
; PLAN: r0=256(x1), r1=254(y1), r2=485(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=92(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=181(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 254
LDI r2, 485
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 92
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 181
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
