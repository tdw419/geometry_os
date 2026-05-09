; DESCRIPTION: Composite: Places a white dot at position (217, 143) then Draws a blue line from (320, 235) to (507, 231) then Draws a purple circle centered at (219, 94) with radius 19.
; PLAN: r0=217(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x1), r6=235(y1), r7=507(x2), r8=231(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=94(y), r12=19(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 217
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 235
LDI r7, 507
LDI r8, 231
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 94
LDI r12, 19
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
