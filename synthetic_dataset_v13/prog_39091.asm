; DESCRIPTION: Creates a red rectangular region at (316, 88) spanning 119 by 97 pixels.
; PLAN: r0=316(x), r1=88(y), r2=119(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 88
LDI r2, 119
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
