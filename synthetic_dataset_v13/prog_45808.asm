; DESCRIPTION: Creates a purple rectangular region at (471, 185) spanning 32 by 67 pixels.
; PLAN: r0=471(x), r1=185(y), r2=32(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 185
LDI r2, 32
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
