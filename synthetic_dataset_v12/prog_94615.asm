; DESCRIPTION: Creates a green rectangular region at (200, 5) spanning 119 by 96 pixels.
; PLAN: r0=200(x), r1=5(y), r2=119(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 5
LDI r2, 119
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
