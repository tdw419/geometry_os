; DESCRIPTION: Creates a purple rectangular region at (67, 67) spanning 11 by 39 pixels.
; PLAN: r0=67(x), r1=67(y), r2=11(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 67
LDI r2, 11
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
