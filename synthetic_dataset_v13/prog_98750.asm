; DESCRIPTION: Creates a green rectangular region at (234, 102) spanning 88 by 52 pixels.
; PLAN: r0=234(x), r1=102(y), r2=88(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 102
LDI r2, 88
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
