; DESCRIPTION: Composite: Places a white circle of radius 10 at center (424, 227) then Places a green dot at position (481, 217) then Draws a orange line from (411, 16) to (429, 35).
; PLAN: r0=424(x), r1=227(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x), r6=217(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=411(x1), r11=16(y1), r12=429(x2), r13=35(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 227
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 217
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 411
LDI r11, 16
LDI r12, 429
LDI r13, 35
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
