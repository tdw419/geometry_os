; DESCRIPTION: Composite: Creates a orange rectangular region at (352, 105) spanning 118 by 16 pixels then Renders a purple line between points (18, 40) and (286, 239).
; PLAN: r0=352(x), r1=105(y), r2=118(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x1), r6=40(y1), r7=286(x2), r8=239(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 105
LDI r2, 118
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 40
LDI r7, 286
LDI r8, 239
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
