; DESCRIPTION: Composite: Places a purple dot at position (31, 49) then Places a blue 50x104 rectangle at position (253, 70) then Draws a green line from (99, 227) to (349, 165).
; PLAN: r0=31(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=70(y), r7=50(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x1), r11=227(y1), r12=349(x2), r13=165(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 70
LDI r7, 50
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 227
LDI r12, 349
LDI r13, 165
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
