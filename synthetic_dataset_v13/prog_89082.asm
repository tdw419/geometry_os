; DESCRIPTION: Composite: Creates a purple rectangular region at (102, 72) spanning 27 by 80 pixels then Places a orange line segment connecting (312, 188) to (357, 253).
; PLAN: r0=102(x), r1=72(y), r2=27(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=188(y1), r7=357(x2), r8=253(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 72
LDI r2, 27
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 188
LDI r7, 357
LDI r8, 253
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
