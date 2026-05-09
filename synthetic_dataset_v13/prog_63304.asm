; DESCRIPTION: Creates a red rectangular region at (414, 123) spanning 49 by 28 pixels.
; PLAN: r0=414(x), r1=123(y), r2=49(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 123
LDI r2, 49
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
