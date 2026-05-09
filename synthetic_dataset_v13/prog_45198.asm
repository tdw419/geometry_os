; DESCRIPTION: Composite: Renders a orange box of size 61x65 starting at (351, 33) then Draws a purple line from (250, 21) to (507, 179).
; PLAN: r0=351(x), r1=33(y), r2=61(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x1), r6=21(y1), r7=507(x2), r8=179(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 33
LDI r2, 61
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 21
LDI r7, 507
LDI r8, 179
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
