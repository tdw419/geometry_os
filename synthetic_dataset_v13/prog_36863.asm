; DESCRIPTION: Composite: Places a white dot at position (27, 38) then Creates a black rectangular region at (154, 58) spanning 100 by 28 pixels then Places a orange line segment connecting (328, 201) to (439, 46).
; PLAN: r0=27(x), r1=38(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=58(y), r7=100(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x1), r11=201(y1), r12=439(x2), r13=46(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 38
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 58
LDI r7, 100
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 201
LDI r12, 439
LDI r13, 46
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
