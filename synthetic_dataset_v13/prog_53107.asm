; DESCRIPTION: Creates a purple rectangular region at (310, 2) spanning 115 by 97 pixels.
; PLAN: r0=310(x), r1=2(y), r2=115(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 2
LDI r2, 115
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
