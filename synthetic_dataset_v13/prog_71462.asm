; DESCRIPTION: Composite: Sets a single white pixel at (191, 105) then Draws a blue line from (283, 248) to (82, 103) then Creates a red circular shape at (471, 69) with radius 33.
; PLAN: r0=191(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=248(y1), r7=82(x2), r8=103(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=69(y), r12=33(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 248
LDI r7, 82
LDI r8, 103
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 69
LDI r12, 33
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
