; DESCRIPTION: Composite: Creates a green circular shape at (133, 160) with radius 33 then Creates a purple rectangular region at (362, 157) spanning 80 by 74 pixels then Places a blue dot at position (159, 206).
; PLAN: r0=133(x), r1=160(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=157(y), r7=80(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=206(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 160
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 157
LDI r7, 80
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 206
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
