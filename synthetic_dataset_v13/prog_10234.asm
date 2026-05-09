; DESCRIPTION: Renders a black box of size 119x63 starting at (140, 106).
; PLAN: r0=140(x), r1=106(y), r2=119(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 106
LDI r2, 119
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
