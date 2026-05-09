; DESCRIPTION: Renders a blue box of size 62x26 starting at (83, 60).
; PLAN: r0=83(x), r1=60(y), r2=62(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 60
LDI r2, 62
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
