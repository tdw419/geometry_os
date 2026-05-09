; DESCRIPTION: Creates a purple rectangular region at (409, 170) spanning 96 by 39 pixels.
; PLAN: r0=409(x), r1=170(y), r2=96(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 170
LDI r2, 96
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
