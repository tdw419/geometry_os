; DESCRIPTION: Renders a black box of size 60x10 starting at (282, 23).
; PLAN: r0=282(x), r1=23(y), r2=60(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 23
LDI r2, 60
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
