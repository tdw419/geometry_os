; DESCRIPTION: Creates a blue rectangular region at (76, 235) spanning 88 by 15 pixels.
; PLAN: r0=76(x), r1=235(y), r2=88(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 235
LDI r2, 88
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
