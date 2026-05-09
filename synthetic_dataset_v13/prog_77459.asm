; DESCRIPTION: Creates a green rectangular region at (148, 76) spanning 80 by 112 pixels.
; PLAN: r0=148(x), r1=76(y), r2=80(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 76
LDI r2, 80
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
