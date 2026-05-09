; DESCRIPTION: Creates a purple rectangular region at (292, 52) spanning 78 by 116 pixels.
; PLAN: r0=292(x), r1=52(y), r2=78(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 52
LDI r2, 78
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
