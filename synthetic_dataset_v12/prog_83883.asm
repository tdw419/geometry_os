; DESCRIPTION: Composite: Sets a single orange pixel at (459, 37) then Draws a blue line from (311, 158) to (485, 236) then Creates a orange circular shape at (386, 81) with radius 51.
; PLAN: r0=459(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=311(x1), r6=158(y1), r7=485(x2), r8=236(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=81(y), r12=51(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 311
LDI r6, 158
LDI r7, 485
LDI r8, 236
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 81
LDI r12, 51
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
