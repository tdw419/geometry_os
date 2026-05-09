; DESCRIPTION: Renders a black box of size 93x79 starting at (136, 4).
; PLAN: r0=136(x), r1=4(y), r2=93(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 4
LDI r2, 93
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
