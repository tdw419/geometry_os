; DESCRIPTION: Creates a green rectangular region at (229, 123) spanning 101 by 56 pixels.
; PLAN: r0=229(x), r1=123(y), r2=101(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 123
LDI r2, 101
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
