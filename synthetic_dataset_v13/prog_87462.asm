; DESCRIPTION: Creates a purple rectangular region at (11, 136) spanning 27 by 35 pixels.
; PLAN: r0=11(x), r1=136(y), r2=27(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 136
LDI r2, 27
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
