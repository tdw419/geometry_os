; DESCRIPTION: Creates a black rectangular region at (288, 88) spanning 35 by 61 pixels.
; PLAN: r0=288(x), r1=88(y), r2=35(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 88
LDI r2, 35
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
