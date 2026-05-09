; DESCRIPTION: Renders a blue box of size 64x17 starting at (382, 121).
; PLAN: r0=382(x), r1=121(y), r2=64(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 121
LDI r2, 64
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
