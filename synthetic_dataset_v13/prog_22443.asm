; DESCRIPTION: Creates a green rectangular region at (159, 100) spanning 63 by 43 pixels.
; PLAN: r0=159(x), r1=100(y), r2=63(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 100
LDI r2, 63
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
