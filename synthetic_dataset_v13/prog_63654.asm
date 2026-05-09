; DESCRIPTION: Creates a purple rectangular region at (125, 21) spanning 97 by 11 pixels.
; PLAN: r0=125(x), r1=21(y), r2=97(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 21
LDI r2, 97
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
