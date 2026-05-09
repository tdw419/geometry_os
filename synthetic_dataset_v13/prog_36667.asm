; DESCRIPTION: Creates a blue rectangular region at (150, 142) spanning 88 by 62 pixels.
; PLAN: r0=150(x), r1=142(y), r2=88(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 142
LDI r2, 88
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
