; DESCRIPTION: Creates a purple rectangular region at (28, 102) spanning 67 by 110 pixels.
; PLAN: r0=28(x), r1=102(y), r2=67(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 102
LDI r2, 67
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
