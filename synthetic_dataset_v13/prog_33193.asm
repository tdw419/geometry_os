; DESCRIPTION: Renders a purple box of size 95x101 starting at (265, 11).
; PLAN: r0=265(x), r1=11(y), r2=95(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 11
LDI r2, 95
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
