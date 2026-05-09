; DESCRIPTION: Creates a purple rectangular region at (407, 210) spanning 88 by 23 pixels.
; PLAN: r0=407(x), r1=210(y), r2=88(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 210
LDI r2, 88
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
