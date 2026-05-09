; DESCRIPTION: Composite: Places a purple 86x29 rectangle at position (381, 201) then Draws a blue line from (84, 133) to (189, 216).
; PLAN: r0=381(x), r1=201(y), r2=86(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x1), r6=133(y1), r7=189(x2), r8=216(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 201
LDI r2, 86
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 133
LDI r7, 189
LDI r8, 216
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
