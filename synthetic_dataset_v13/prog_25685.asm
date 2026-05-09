; DESCRIPTION: Renders a blue box of size 62x50 starting at (347, 97).
; PLAN: r0=347(x), r1=97(y), r2=62(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 97
LDI r2, 62
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
