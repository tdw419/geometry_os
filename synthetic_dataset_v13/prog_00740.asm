; DESCRIPTION: Creates a purple rectangular region at (28, 43) spanning 78 by 76 pixels.
; PLAN: r0=28(x), r1=43(y), r2=78(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 43
LDI r2, 78
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
