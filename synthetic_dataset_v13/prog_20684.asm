; DESCRIPTION: Creates a purple rectangular region at (316, 175) spanning 70 by 19 pixels.
; PLAN: r0=316(x), r1=175(y), r2=70(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 175
LDI r2, 70
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
