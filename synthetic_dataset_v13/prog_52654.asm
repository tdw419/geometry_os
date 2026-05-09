; DESCRIPTION: Creates a blue rectangular region at (282, 97) spanning 56 by 35 pixels.
; PLAN: r0=282(x), r1=97(y), r2=56(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 97
LDI r2, 56
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
