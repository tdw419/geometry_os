; DESCRIPTION: Creates a magenta rectangular region at (427, 22) spanning 45 by 118 pixels.
; PLAN: r0=427(x), r1=22(y), r2=45(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 22
LDI r2, 45
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
