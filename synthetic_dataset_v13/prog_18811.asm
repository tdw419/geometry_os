; DESCRIPTION: Renders a black box of size 107x94 starting at (119, 24).
; PLAN: r0=119(x), r1=24(y), r2=107(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 24
LDI r2, 107
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
