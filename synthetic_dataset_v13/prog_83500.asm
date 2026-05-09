; DESCRIPTION: Creates a purple rectangular region at (67, 36) spanning 21 by 81 pixels.
; PLAN: r0=67(x), r1=36(y), r2=21(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 36
LDI r2, 21
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
