; DESCRIPTION: Composite: Creates a white circular shape at (200, 179) with radius 71 then Sets a single blue pixel at (183, 146) then Draws a blue line from (454, 116) to (456, 172).
; PLAN: r0=200(x), r1=179(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=146(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=454(x1), r11=116(y1), r12=456(x2), r13=172(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 179
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 146
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 454
LDI r11, 116
LDI r12, 456
LDI r13, 172
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
