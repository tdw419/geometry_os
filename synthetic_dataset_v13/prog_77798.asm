; DESCRIPTION: Creates a yellow rectangular region at (157, 158) spanning 101 by 21 pixels.
; PLAN: r0=157(x), r1=158(y), r2=101(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 158
LDI r2, 101
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
