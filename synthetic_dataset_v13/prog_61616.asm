; DESCRIPTION: Composite: Sets a single red pixel at (14, 207) then Renders a black box of size 17x17 starting at (202, 192) then Renders a green line between points (11, 164) and (501, 130).
; PLAN: r0=14(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=192(y), r7=17(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x1), r11=164(y1), r12=501(x2), r13=130(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 207
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 192
LDI r7, 17
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 164
LDI r12, 501
LDI r13, 130
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
