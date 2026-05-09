; DESCRIPTION: Renders a purple box of size 105x101 starting at (292, 72).
; PLAN: r0=292(x), r1=72(y), r2=105(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 72
LDI r2, 105
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
