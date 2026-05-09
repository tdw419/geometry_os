; DESCRIPTION: Creates a green rectangular region at (283, 214) spanning 101 by 10 pixels.
; PLAN: r0=283(x), r1=214(y), r2=101(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 214
LDI r2, 101
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
