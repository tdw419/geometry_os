; DESCRIPTION: Composite: Sets a single black pixel at (397, 39) then Creates a white circular shape at (317, 143) with radius 79 then Draws a blue line from (438, 138) to (41, 185).
; PLAN: r0=397(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=143(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=438(x1), r11=138(y1), r12=41(x2), r13=185(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 143
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 438
LDI r11, 138
LDI r12, 41
LDI r13, 185
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
