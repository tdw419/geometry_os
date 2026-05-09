; DESCRIPTION: Renders a blue box of size 96x88 starting at (336, 137).
; PLAN: r0=336(x), r1=137(y), r2=96(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 137
LDI r2, 96
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
