; DESCRIPTION: Renders a white box of size 81x63 starting at (347, 149).
; PLAN: r0=347(x), r1=149(y), r2=81(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 149
LDI r2, 81
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
