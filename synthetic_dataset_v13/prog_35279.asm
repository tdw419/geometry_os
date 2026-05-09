; DESCRIPTION: Composite: Draws a white line from (143, 234) to (507, 69) then Sets a single purple pixel at (108, 164) then Creates a white circular shape at (253, 153) with radius 22.
; PLAN: r0=143(x1), r1=234(y1), r2=507(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=164(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=253(x), r11=153(y), r12=22(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 234
LDI r2, 507
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 164
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 253
LDI r11, 153
LDI r12, 22
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
