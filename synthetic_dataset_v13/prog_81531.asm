; DESCRIPTION: Creates a purple rectangular region at (293, 203) spanning 75 by 18 pixels.
; PLAN: r0=293(x), r1=203(y), r2=75(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 203
LDI r2, 75
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
