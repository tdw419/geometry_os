; DESCRIPTION: Renders a blue box of size 24x18 starting at (93, 203).
; PLAN: r0=93(x), r1=203(y), r2=24(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 203
LDI r2, 24
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
