; DESCRIPTION: Creates a purple rectangular region at (471, 132) spanning 13 by 100 pixels.
; PLAN: r0=471(x), r1=132(y), r2=13(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 132
LDI r2, 13
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
