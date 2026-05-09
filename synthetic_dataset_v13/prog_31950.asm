; DESCRIPTION: Creates a black rectangular region at (313, 21) spanning 119 by 96 pixels.
; PLAN: r0=313(x), r1=21(y), r2=119(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 21
LDI r2, 119
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
