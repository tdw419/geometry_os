; DESCRIPTION: Creates a yellow rectangular region at (227, 148) spanning 88 by 82 pixels.
; PLAN: r0=227(x), r1=148(y), r2=88(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 148
LDI r2, 88
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
