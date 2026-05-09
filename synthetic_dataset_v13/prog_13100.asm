; DESCRIPTION: Composite: Creates a purple rectangular region at (4, 18) spanning 101 by 95 pixels then Draws a blue line from (365, 10) to (8, 172).
; PLAN: r0=4(x), r1=18(y), r2=101(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=10(y1), r7=8(x2), r8=172(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 18
LDI r2, 101
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 10
LDI r7, 8
LDI r8, 172
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
