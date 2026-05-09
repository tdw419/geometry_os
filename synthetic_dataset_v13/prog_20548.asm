; DESCRIPTION: Creates a blue rectangular region at (219, 97) spanning 56 by 62 pixels.
; PLAN: r0=219(x), r1=97(y), r2=56(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 97
LDI r2, 56
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
