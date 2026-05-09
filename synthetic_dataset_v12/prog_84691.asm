; DESCRIPTION: Composite: Places a purple 26x105 rectangle at position (309, 11) then Draws a white line from (501, 68) to (262, 222).
; PLAN: r0=309(x), r1=11(y), r2=26(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=68(y1), r7=262(x2), r8=222(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 11
LDI r2, 26
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 68
LDI r7, 262
LDI r8, 222
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
