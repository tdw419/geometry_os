; DESCRIPTION: Composite: Creates a orange rectangular region at (188, 149) spanning 33 by 67 pixels then Renders a orange line between points (336, 15) and (101, 19).
; PLAN: r0=188(x), r1=149(y), r2=33(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=15(y1), r7=101(x2), r8=19(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 149
LDI r2, 33
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 15
LDI r7, 101
LDI r8, 19
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
