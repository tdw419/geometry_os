; DESCRIPTION: Composite: Places a red 49x82 rectangle at position (177, 68) then Draws a black line from (313, 253) to (46, 212) then Places a black circle of radius 76 at center (201, 81).
; PLAN: r0=177(x), r1=68(y), r2=49(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=253(y1), r7=46(x2), r8=212(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=201(x), r11=81(y), r12=76(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 177
LDI r1, 68
LDI r2, 49
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 253
LDI r7, 46
LDI r8, 212
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 81
LDI r12, 76
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
