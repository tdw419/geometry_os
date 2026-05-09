; DESCRIPTION: Renders a black box of size 23x92 starting at (310, 24).
; PLAN: r0=310(x), r1=24(y), r2=23(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 24
LDI r2, 23
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
