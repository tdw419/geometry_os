; DESCRIPTION: Creates a blue rectangular region at (122, 88) spanning 64 by 117 pixels.
; PLAN: r0=122(x), r1=88(y), r2=64(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 88
LDI r2, 64
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
