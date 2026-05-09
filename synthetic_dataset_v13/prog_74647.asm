; DESCRIPTION: Renders a black box of size 113x113 starting at (93, 66).
; PLAN: r0=93(x), r1=66(y), r2=113(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 66
LDI r2, 113
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
