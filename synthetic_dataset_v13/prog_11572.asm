; DESCRIPTION: Creates a green rectangular region at (227, 15) spanning 93 by 34 pixels.
; PLAN: r0=227(x), r1=15(y), r2=93(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 15
LDI r2, 93
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
