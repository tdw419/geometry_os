; DESCRIPTION: Creates a black rectangular region at (244, 78) spanning 92 by 65 pixels.
; PLAN: r0=244(x), r1=78(y), r2=92(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 78
LDI r2, 92
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
