; DESCRIPTION: Renders a green box of size 43x100 starting at (378, 63).
; PLAN: r0=378(x), r1=63(y), r2=43(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 63
LDI r2, 43
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
