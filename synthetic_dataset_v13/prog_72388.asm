; DESCRIPTION: Composite: Places a purple 26x50 rectangle at position (362, 126) then Renders a green line between points (251, 33) and (428, 176) then Creates a white circular shape at (369, 41) with radius 41.
; PLAN: r0=362(x), r1=126(y), r2=26(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=33(y1), r7=428(x2), r8=176(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=41(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 126
LDI r2, 26
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 33
LDI r7, 428
LDI r8, 176
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 41
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
