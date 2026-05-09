; DESCRIPTION: Creates a green rectangular region at (254, 43) spanning 17 by 90 pixels.
; PLAN: r0=254(x), r1=43(y), r2=17(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 43
LDI r2, 17
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
