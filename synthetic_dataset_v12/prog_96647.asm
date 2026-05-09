; DESCRIPTION: Renders a black box of size 19x93 starting at (120, 130).
; PLAN: r0=120(x), r1=130(y), r2=19(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 130
LDI r2, 19
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
