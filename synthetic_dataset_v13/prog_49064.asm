; DESCRIPTION: Renders a black box of size 74x10 starting at (194, 211).
; PLAN: r0=194(x), r1=211(y), r2=74(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 211
LDI r2, 74
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
