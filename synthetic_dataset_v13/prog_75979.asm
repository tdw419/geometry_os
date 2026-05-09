; DESCRIPTION: Renders a blue box of size 71x28 starting at (101, 183).
; PLAN: r0=101(x), r1=183(y), r2=71(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 183
LDI r2, 71
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
