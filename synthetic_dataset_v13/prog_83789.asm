; DESCRIPTION: Composite: Sets a single black pixel at (99, 28) then Places a purple 97x87 rectangle at position (308, 17) then Draws a magenta line from (134, 133) to (482, 251).
; PLAN: r0=99(x), r1=28(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=17(y), r7=97(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x1), r11=133(y1), r12=482(x2), r13=251(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 28
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 308
LDI r6, 17
LDI r7, 97
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 133
LDI r12, 482
LDI r13, 251
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
