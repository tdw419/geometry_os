; DESCRIPTION: Renders a black box of size 13x85 starting at (490, 24).
; PLAN: r0=490(x), r1=24(y), r2=13(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 24
LDI r2, 13
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
