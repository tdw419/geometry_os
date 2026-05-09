; DESCRIPTION: Renders a yellow box of size 29x119 starting at (477, 26).
; PLAN: r0=477(x), r1=26(y), r2=29(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 26
LDI r2, 29
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
