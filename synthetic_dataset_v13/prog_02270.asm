; DESCRIPTION: Creates a blue rectangular region at (100, 88) spanning 96 by 24 pixels.
; PLAN: r0=100(x), r1=88(y), r2=96(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 88
LDI r2, 96
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
