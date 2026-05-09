; DESCRIPTION: Creates a purple rectangular region at (316, 44) spanning 119 by 33 pixels.
; PLAN: r0=316(x), r1=44(y), r2=119(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 44
LDI r2, 119
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
