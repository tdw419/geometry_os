; DESCRIPTION: Creates a purple rectangular region at (381, 113) spanning 32 by 108 pixels.
; PLAN: r0=381(x), r1=113(y), r2=32(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 113
LDI r2, 32
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
