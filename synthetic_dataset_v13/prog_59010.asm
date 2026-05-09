; DESCRIPTION: Renders a blue box of size 74x62 starting at (163, 51).
; PLAN: r0=163(x), r1=51(y), r2=74(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 51
LDI r2, 74
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
