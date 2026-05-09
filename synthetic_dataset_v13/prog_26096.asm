; DESCRIPTION: Creates a green rectangular region at (406, 14) spanning 100 by 81 pixels.
; PLAN: r0=406(x), r1=14(y), r2=100(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 14
LDI r2, 100
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
