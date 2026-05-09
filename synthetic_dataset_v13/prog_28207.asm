; DESCRIPTION: Renders a blue box of size 111x30 starting at (22, 105).
; PLAN: r0=22(x), r1=105(y), r2=111(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 105
LDI r2, 111
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
