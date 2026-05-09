; DESCRIPTION: Composite: Sets a single white pixel at (33, 112) then Draws a black circle centered at (312, 122) with radius 60 then Draws a blue line from (122, 65) to (184, 131).
; PLAN: r0=33(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=122(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x1), r11=65(y1), r12=184(x2), r13=131(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 122
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 65
LDI r12, 184
LDI r13, 131
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
