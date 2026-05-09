; DESCRIPTION: Renders a blue box of size 35x37 starting at (347, 134).
; PLAN: r0=347(x), r1=134(y), r2=35(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 134
LDI r2, 35
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
