; DESCRIPTION: Creates a purple rectangular region at (28, 123) spanning 38 by 24 pixels.
; PLAN: r0=28(x), r1=123(y), r2=38(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 123
LDI r2, 38
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
