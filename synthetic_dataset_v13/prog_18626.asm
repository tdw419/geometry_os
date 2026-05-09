; DESCRIPTION: Renders a purple box of size 109x118 starting at (183, 10).
; PLAN: r0=183(x), r1=10(y), r2=109(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 10
LDI r2, 109
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
