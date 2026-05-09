; DESCRIPTION: Creates a green rectangular region at (162, 23) spanning 90 by 101 pixels.
; PLAN: r0=162(x), r1=23(y), r2=90(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 23
LDI r2, 90
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
