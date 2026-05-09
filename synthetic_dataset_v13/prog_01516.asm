; DESCRIPTION: Creates a black rectangular region at (161, 135) spanning 35 by 66 pixels.
; PLAN: r0=161(x), r1=135(y), r2=35(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 135
LDI r2, 35
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
