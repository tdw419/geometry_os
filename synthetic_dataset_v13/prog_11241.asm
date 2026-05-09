; DESCRIPTION: Creates a blue rectangular region at (14, 113) spanning 64 by 101 pixels.
; PLAN: r0=14(x), r1=113(y), r2=64(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 113
LDI r2, 64
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
