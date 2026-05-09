; DESCRIPTION: Creates a purple rectangular region at (316, 170) spanning 35 by 25 pixels.
; PLAN: r0=316(x), r1=170(y), r2=35(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 170
LDI r2, 35
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
