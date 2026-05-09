; DESCRIPTION: Renders a black box of size 109x46 starting at (282, 90).
; PLAN: r0=282(x), r1=90(y), r2=109(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 90
LDI r2, 109
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
