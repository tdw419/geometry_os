; DESCRIPTION: Composite: Sets a single red pixel at (49, 115) then Places a magenta circle of radius 13 at center (499, 81) then Places a magenta line segment connecting (393, 106) to (21, 11).
; PLAN: r0=49(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=499(x), r6=81(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x1), r11=106(y1), r12=21(x2), r13=11(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 499
LDI r6, 81
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 106
LDI r12, 21
LDI r13, 11
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
