; DESCRIPTION: Composite: Places a black dot at position (381, 64) then Creates a black rectangular region at (26, 64) spanning 30 by 33 pixels then Renders a green line between points (179, 68) and (223, 227).
; PLAN: r0=381(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=64(y), r7=30(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x1), r11=68(y1), r12=223(x2), r13=227(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 26
LDI r6, 64
LDI r7, 30
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 68
LDI r12, 223
LDI r13, 227
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
