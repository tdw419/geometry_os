; DESCRIPTION: Creates a black rectangular region at (334, 88) spanning 115 by 59 pixels.
; PLAN: r0=334(x), r1=88(y), r2=115(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 88
LDI r2, 115
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
