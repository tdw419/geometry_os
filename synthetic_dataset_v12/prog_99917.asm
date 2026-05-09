; DESCRIPTION: Creates a black rectangular region at (96, 88) spanning 34 by 59 pixels.
; PLAN: r0=96(x), r1=88(y), r2=34(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 88
LDI r2, 34
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
