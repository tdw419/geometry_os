; DESCRIPTION: Creates a purple rectangular region at (191, 19) spanning 115 by 35 pixels.
; PLAN: r0=191(x), r1=19(y), r2=115(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 19
LDI r2, 115
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
