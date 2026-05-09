; DESCRIPTION: Creates a purple rectangular region at (348, 35) spanning 43 by 79 pixels.
; PLAN: r0=348(x), r1=35(y), r2=43(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 35
LDI r2, 43
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
