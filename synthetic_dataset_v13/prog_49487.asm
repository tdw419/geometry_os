; DESCRIPTION: Renders a black box of size 93x112 starting at (24, 71).
; PLAN: r0=24(x), r1=71(y), r2=93(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 71
LDI r2, 93
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
