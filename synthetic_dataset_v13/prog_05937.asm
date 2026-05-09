; DESCRIPTION: Creates a purple rectangular region at (397, 80) spanning 84 by 14 pixels.
; PLAN: r0=397(x), r1=80(y), r2=84(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 80
LDI r2, 84
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
