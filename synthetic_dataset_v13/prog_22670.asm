; DESCRIPTION: Renders a blue box of size 43x63 starting at (118, 134).
; PLAN: r0=118(x), r1=134(y), r2=43(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 134
LDI r2, 43
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
