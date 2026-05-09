; DESCRIPTION: Creates a purple rectangular region at (286, 96) spanning 110 by 22 pixels.
; PLAN: r0=286(x), r1=96(y), r2=110(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 96
LDI r2, 110
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
