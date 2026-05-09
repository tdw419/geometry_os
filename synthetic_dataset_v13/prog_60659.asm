; DESCRIPTION: Creates a red rectangular region at (20, 86) spanning 88 by 114 pixels.
; PLAN: r0=20(x), r1=86(y), r2=88(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 86
LDI r2, 88
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
