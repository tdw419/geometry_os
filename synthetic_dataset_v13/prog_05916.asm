; DESCRIPTION: Renders a blue box of size 100x63 starting at (134, 135).
; PLAN: r0=134(x), r1=135(y), r2=100(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 135
LDI r2, 100
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
