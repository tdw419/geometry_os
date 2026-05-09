; DESCRIPTION: Renders a black box of size 84x119 starting at (417, 67).
; PLAN: r0=417(x), r1=67(y), r2=84(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 67
LDI r2, 84
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
