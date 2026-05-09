; DESCRIPTION: Creates a blue rectangular region at (265, 0) spanning 88 by 90 pixels.
; PLAN: r0=265(x), r1=0(y), r2=88(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 0
LDI r2, 88
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
