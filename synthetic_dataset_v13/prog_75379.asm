; DESCRIPTION: Creates a yellow rectangular region at (244, 148) spanning 89 by 95 pixels.
; PLAN: r0=244(x), r1=148(y), r2=89(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 148
LDI r2, 89
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
