; DESCRIPTION: Composite: Sets a single orange pixel at (115, 157) then Renders a purple box of size 91x53 starting at (316, 83) then Renders a black line between points (130, 207) and (202, 254).
; PLAN: r0=115(x), r1=157(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=83(y), r7=91(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x1), r11=207(y1), r12=202(x2), r13=254(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 157
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 316
LDI r6, 83
LDI r7, 91
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 207
LDI r12, 202
LDI r13, 254
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
