; DESCRIPTION: Composite: Creates a orange rectangular region at (343, 14) spanning 84 by 44 pixels then Renders a orange line between points (468, 135) and (67, 39).
; PLAN: r0=343(x), r1=14(y), r2=84(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=135(y1), r7=67(x2), r8=39(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 14
LDI r2, 84
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 135
LDI r7, 67
LDI r8, 39
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
