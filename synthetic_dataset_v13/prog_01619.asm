; DESCRIPTION: Renders a blue box of size 49x112 starting at (361, 2).
; PLAN: r0=361(x), r1=2(y), r2=49(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 2
LDI r2, 49
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
