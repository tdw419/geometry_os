; DESCRIPTION: Creates a purple rectangular region at (254, 12) spanning 40 by 119 pixels.
; PLAN: r0=254(x), r1=12(y), r2=40(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 12
LDI r2, 40
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
