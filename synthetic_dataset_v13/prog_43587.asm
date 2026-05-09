; DESCRIPTION: Renders a purple box of size 109x93 starting at (227, 9).
; PLAN: r0=227(x), r1=9(y), r2=109(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 9
LDI r2, 109
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
