; DESCRIPTION: Creates a green rectangular region at (241, 81) spanning 22 by 88 pixels.
; PLAN: r0=241(x), r1=81(y), r2=22(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 81
LDI r2, 22
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
