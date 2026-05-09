; DESCRIPTION: Creates a green rectangular region at (153, 22) spanning 101 by 115 pixels.
; PLAN: r0=153(x), r1=22(y), r2=101(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 22
LDI r2, 101
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
