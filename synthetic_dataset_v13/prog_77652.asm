; DESCRIPTION: Composite: Sets a single purple pixel at (58, 205) then Renders a magenta disk with center (379, 100) and radius 33 then Draws a white line from (124, 141) to (484, 136).
; PLAN: r0=58(x), r1=205(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=100(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x1), r11=141(y1), r12=484(x2), r13=136(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 205
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 100
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 141
LDI r12, 484
LDI r13, 136
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
