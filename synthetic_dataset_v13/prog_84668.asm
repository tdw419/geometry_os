; DESCRIPTION: Renders a blue box of size 74x53 starting at (351, 52).
; PLAN: r0=351(x), r1=52(y), r2=74(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 52
LDI r2, 74
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
