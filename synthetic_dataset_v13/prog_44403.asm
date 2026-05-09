; DESCRIPTION: Creates a purple rectangular region at (373, 1) spanning 81 by 35 pixels.
; PLAN: r0=373(x), r1=1(y), r2=81(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 1
LDI r2, 81
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
