; DESCRIPTION: Creates a green rectangular region at (282, 166) spanning 119 by 17 pixels.
; PLAN: r0=282(x), r1=166(y), r2=119(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 166
LDI r2, 119
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
