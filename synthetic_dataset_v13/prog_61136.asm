; DESCRIPTION: Creates a purple rectangular region at (119, 114) spanning 20 by 81 pixels.
; PLAN: r0=119(x), r1=114(y), r2=20(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 114
LDI r2, 20
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
