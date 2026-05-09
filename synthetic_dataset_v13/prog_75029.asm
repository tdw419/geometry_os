; DESCRIPTION: Renders a blue box of size 26x13 starting at (85, 39).
; PLAN: r0=85(x), r1=39(y), r2=26(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 39
LDI r2, 26
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
