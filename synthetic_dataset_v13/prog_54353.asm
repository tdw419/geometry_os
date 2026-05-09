; DESCRIPTION: Creates a purple rectangular region at (409, 108) spanning 97 by 101 pixels.
; PLAN: r0=409(x), r1=108(y), r2=97(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 108
LDI r2, 97
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
