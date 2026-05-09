; DESCRIPTION: Renders a black box of size 93x90 starting at (122, 119).
; PLAN: r0=122(x), r1=119(y), r2=93(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 119
LDI r2, 93
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
