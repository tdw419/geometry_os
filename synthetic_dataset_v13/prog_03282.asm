; DESCRIPTION: Creates a purple rectangular region at (313, 88) spanning 39 by 73 pixels.
; PLAN: r0=313(x), r1=88(y), r2=39(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 88
LDI r2, 39
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
