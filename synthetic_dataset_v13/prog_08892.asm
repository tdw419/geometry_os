; DESCRIPTION: Composite: Creates a orange rectangular region at (59, 73) spanning 95 by 92 pixels then Renders a orange line between points (347, 251) and (174, 97).
; PLAN: r0=59(x), r1=73(y), r2=95(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=251(y1), r7=174(x2), r8=97(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 73
LDI r2, 95
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 251
LDI r7, 174
LDI r8, 97
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
