; DESCRIPTION: Creates a green rectangular region at (76, 163) spanning 55 by 43 pixels.
; PLAN: r0=76(x), r1=163(y), r2=55(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 163
LDI r2, 55
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
