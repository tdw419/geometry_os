; DESCRIPTION: Composite: Sets a single orange pixel at (317, 16) then Places a green 81x40 rectangle at position (178, 14) then Draws a purple line from (206, 227) to (351, 194).
; PLAN: r0=317(x), r1=16(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=14(y), r7=81(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=227(y1), r12=351(x2), r13=194(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 16
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 178
LDI r6, 14
LDI r7, 81
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 227
LDI r12, 351
LDI r13, 194
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
