; DESCRIPTION: Creates a magenta rectangular region at (129, 123) spanning 118 by 14 pixels.
; PLAN: r0=129(x), r1=123(y), r2=118(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 123
LDI r2, 118
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
