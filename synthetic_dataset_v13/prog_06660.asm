; DESCRIPTION: Renders a black box of size 29x85 starting at (299, 72).
; PLAN: r0=299(x), r1=72(y), r2=29(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 72
LDI r2, 29
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
