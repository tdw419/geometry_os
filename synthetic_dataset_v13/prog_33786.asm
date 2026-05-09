; DESCRIPTION: Composite: Places a black dot at position (195, 218) then Places a orange line segment connecting (229, 235) to (139, 142) then Places a yellow 71x65 rectangle at position (122, 32).
; PLAN: r0=195(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=229(x1), r6=235(y1), r7=139(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=32(y), r12=71(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 229
LDI r6, 235
LDI r7, 139
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 32
LDI r12, 71
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
