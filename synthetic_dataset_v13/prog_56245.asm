; DESCRIPTION: Composite: Draws a red line from (463, 137) to (397, 207) then Renders a purple box of size 26x50 starting at (407, 70).
; PLAN: r0=463(x1), r1=137(y1), r2=397(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=70(y), r7=26(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 137
LDI r2, 397
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 70
LDI r7, 26
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
