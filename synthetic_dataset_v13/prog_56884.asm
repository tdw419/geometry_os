; DESCRIPTION: Creates a purple rectangular region at (293, 84) spanning 81 by 68 pixels.
; PLAN: r0=293(x), r1=84(y), r2=81(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 84
LDI r2, 81
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
