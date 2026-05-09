; DESCRIPTION: Creates a red rectangular region at (78, 87) spanning 88 by 74 pixels.
; PLAN: r0=78(x), r1=87(y), r2=88(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 87
LDI r2, 88
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
