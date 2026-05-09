; DESCRIPTION: Creates a purple rectangular region at (427, 219) spanning 39 by 21 pixels.
; PLAN: r0=427(x), r1=219(y), r2=39(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 219
LDI r2, 39
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
