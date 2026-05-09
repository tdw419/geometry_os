; DESCRIPTION: Creates a purple rectangular region at (28, 76) spanning 79 by 114 pixels.
; PLAN: r0=28(x), r1=76(y), r2=79(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 76
LDI r2, 79
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
