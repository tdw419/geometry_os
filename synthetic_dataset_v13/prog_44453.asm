; DESCRIPTION: Composite: Sets a single red pixel at (184, 51) then Draws a white circle centered at (169, 227) with radius 26 then Draws a white line from (249, 244) to (262, 226).
; PLAN: r0=184(x), r1=51(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=227(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=249(x1), r11=244(y1), r12=262(x2), r13=226(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 51
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 169
LDI r6, 227
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 249
LDI r11, 244
LDI r12, 262
LDI r13, 226
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
