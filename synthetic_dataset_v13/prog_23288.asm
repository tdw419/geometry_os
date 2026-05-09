; DESCRIPTION: Creates a green rectangular region at (209, 56) spanning 119 by 43 pixels.
; PLAN: r0=209(x), r1=56(y), r2=119(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 56
LDI r2, 119
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
