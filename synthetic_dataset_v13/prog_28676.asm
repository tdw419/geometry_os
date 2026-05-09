; DESCRIPTION: Renders a blue box of size 60x26 starting at (78, 45).
; PLAN: r0=78(x), r1=45(y), r2=60(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 45
LDI r2, 60
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
