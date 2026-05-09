; DESCRIPTION: Creates a red rectangular region at (252, 123) spanning 48 by 114 pixels.
; PLAN: r0=252(x), r1=123(y), r2=48(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 123
LDI r2, 48
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
