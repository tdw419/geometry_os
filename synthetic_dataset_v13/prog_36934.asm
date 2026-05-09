; DESCRIPTION: Composite: Sets a single magenta pixel at (221, 214) then Places a blue line segment connecting (25, 75) to (0, 148) then Places a yellow circle of radius 11 at center (348, 74).
; PLAN: r0=221(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=25(x1), r6=75(y1), r7=0(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=74(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 214
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 25
LDI r6, 75
LDI r7, 0
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 74
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
