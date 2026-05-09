; DESCRIPTION: Composite: Renders a black box of size 100x87 starting at (411, 34) then Draws a purple line from (207, 178) to (27, 36).
; PLAN: r0=411(x), r1=34(y), r2=100(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=178(y1), r7=27(x2), r8=36(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 34
LDI r2, 100
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 178
LDI r7, 27
LDI r8, 36
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
