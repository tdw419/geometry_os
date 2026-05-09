; DESCRIPTION: Creates a green rectangular region at (69, 23) spanning 97 by 100 pixels.
; PLAN: r0=69(x), r1=23(y), r2=97(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 23
LDI r2, 97
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
