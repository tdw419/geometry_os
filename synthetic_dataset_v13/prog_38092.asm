; DESCRIPTION: Renders a black box of size 23x43 starting at (83, 148).
; PLAN: r0=83(x), r1=148(y), r2=23(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 148
LDI r2, 23
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
