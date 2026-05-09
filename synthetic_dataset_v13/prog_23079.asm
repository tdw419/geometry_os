; DESCRIPTION: Creates a blue rectangular region at (81, 85) spanning 66 by 88 pixels.
; PLAN: r0=81(x), r1=85(y), r2=66(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 85
LDI r2, 66
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
