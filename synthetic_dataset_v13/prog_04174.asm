; DESCRIPTION: Composite: Places a black dot at position (201, 176) then Draws a purple line from (351, 231) to (14, 123) then Places a magenta 22x35 rectangle at position (298, 10).
; PLAN: r0=201(x), r1=176(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=351(x1), r6=231(y1), r7=14(x2), r8=123(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=10(y), r12=22(width), r13=35(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 176
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 351
LDI r6, 231
LDI r7, 14
LDI r8, 123
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 10
LDI r12, 22
LDI r13, 35
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
