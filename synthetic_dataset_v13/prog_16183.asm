; DESCRIPTION: Creates a white rectangular region at (244, 38) spanning 119 by 117 pixels.
; PLAN: r0=244(x), r1=38(y), r2=119(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 38
LDI r2, 119
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
