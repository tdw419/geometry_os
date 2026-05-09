; DESCRIPTION: Creates a blue rectangular region at (232, 96) spanning 64 by 89 pixels.
; PLAN: r0=232(x), r1=96(y), r2=64(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 96
LDI r2, 64
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
