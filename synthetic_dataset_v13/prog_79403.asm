; DESCRIPTION: Creates a purple rectangular region at (101, 5) spanning 43 by 67 pixels.
; PLAN: r0=101(x), r1=5(y), r2=43(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 5
LDI r2, 43
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
