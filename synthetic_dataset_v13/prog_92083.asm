; DESCRIPTION: Renders a blue box of size 25x26 starting at (473, 130).
; PLAN: r0=473(x), r1=130(y), r2=25(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 130
LDI r2, 25
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
