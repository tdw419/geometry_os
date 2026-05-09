; DESCRIPTION: Composite: Creates a magenta rectangular region at (176, 121) spanning 102 by 112 pixels then Renders a orange line between points (5, 219) and (338, 157).
; PLAN: r0=176(x), r1=121(y), r2=102(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x1), r6=219(y1), r7=338(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 121
LDI r2, 102
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 219
LDI r7, 338
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
