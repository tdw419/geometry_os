; DESCRIPTION: Composite: Places a white dot at position (178, 89) then Places a orange 18x73 rectangle at position (476, 101) then Places a black line segment connecting (207, 38) to (3, 73).
; PLAN: r0=178(x), r1=89(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=476(x), r6=101(y), r7=18(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x1), r11=38(y1), r12=3(x2), r13=73(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 89
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 476
LDI r6, 101
LDI r7, 18
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 38
LDI r12, 3
LDI r13, 73
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
