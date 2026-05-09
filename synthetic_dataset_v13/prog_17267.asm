; DESCRIPTION: Creates a blue rectangular region at (244, 29) spanning 62 by 53 pixels.
; PLAN: r0=244(x), r1=29(y), r2=62(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 29
LDI r2, 62
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
