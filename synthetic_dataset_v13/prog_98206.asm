; DESCRIPTION: Creates a purple rectangular region at (201, 97) spanning 115 by 40 pixels.
; PLAN: r0=201(x), r1=97(y), r2=115(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 97
LDI r2, 115
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
