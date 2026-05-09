; DESCRIPTION: Creates a green rectangular region at (159, 15) spanning 88 by 98 pixels.
; PLAN: r0=159(x), r1=15(y), r2=88(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 15
LDI r2, 88
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
