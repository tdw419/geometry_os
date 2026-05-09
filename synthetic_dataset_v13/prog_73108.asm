; DESCRIPTION: Creates a purple rectangular region at (96, 77) spanning 102 by 119 pixels.
; PLAN: r0=96(x), r1=77(y), r2=102(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 77
LDI r2, 102
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
