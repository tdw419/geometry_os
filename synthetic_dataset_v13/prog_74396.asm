; DESCRIPTION: Renders a black box of size 92x119 starting at (81, 98).
; PLAN: r0=81(x), r1=98(y), r2=92(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 98
LDI r2, 92
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
