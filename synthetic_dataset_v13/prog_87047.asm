; DESCRIPTION: Creates a magenta rectangular region at (314, 9) spanning 87 by 118 pixels.
; PLAN: r0=314(x), r1=9(y), r2=87(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 9
LDI r2, 87
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
