; DESCRIPTION: Renders a blue box of size 101x52 starting at (385, 118).
; PLAN: r0=385(x), r1=118(y), r2=101(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 118
LDI r2, 101
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
