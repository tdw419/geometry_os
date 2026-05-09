; DESCRIPTION: Creates a black rectangular region at (244, 10) spanning 69 by 66 pixels.
; PLAN: r0=244(x), r1=10(y), r2=69(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 10
LDI r2, 69
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
