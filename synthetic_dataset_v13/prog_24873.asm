; DESCRIPTION: Creates a blue rectangular region at (471, 29) spanning 29 by 97 pixels.
; PLAN: r0=471(x), r1=29(y), r2=29(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 29
LDI r2, 29
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
