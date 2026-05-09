; DESCRIPTION: Creates a purple rectangular region at (334, 17) spanning 97 by 97 pixels.
; PLAN: r0=334(x), r1=17(y), r2=97(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 17
LDI r2, 97
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
