; DESCRIPTION: Creates a purple rectangular region at (18, 23) spanning 88 by 90 pixels.
; PLAN: r0=18(x), r1=23(y), r2=88(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 23
LDI r2, 88
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
