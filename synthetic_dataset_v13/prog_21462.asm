; DESCRIPTION: Composite: Sets a single black pixel at (37, 194) then Draws a purple line from (297, 13) to (183, 231) then Renders a purple box of size 22x116 starting at (396, 19).
; PLAN: r0=37(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=297(x1), r6=13(y1), r7=183(x2), r8=231(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=19(y), r12=22(width), r13=116(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 297
LDI r6, 13
LDI r7, 183
LDI r8, 231
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 19
LDI r12, 22
LDI r13, 116
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
