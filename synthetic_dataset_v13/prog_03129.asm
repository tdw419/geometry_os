; DESCRIPTION: Creates a green rectangular region at (101, 157) spanning 78 by 95 pixels.
; PLAN: r0=101(x), r1=157(y), r2=78(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 157
LDI r2, 78
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
