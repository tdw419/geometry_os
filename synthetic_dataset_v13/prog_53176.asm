; DESCRIPTION: Composite: Sets a single magenta pixel at (7, 69) then Creates a magenta circular shape at (214, 112) with radius 78 then Places a blue line segment connecting (204, 164) to (288, 80).
; PLAN: r0=7(x), r1=69(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=112(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x1), r11=164(y1), r12=288(x2), r13=80(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 69
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 112
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 164
LDI r12, 288
LDI r13, 80
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
