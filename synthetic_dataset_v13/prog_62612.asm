; DESCRIPTION: Renders a blue box of size 107x78 starting at (274, 159).
; PLAN: r0=274(x), r1=159(y), r2=107(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 159
LDI r2, 107
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
