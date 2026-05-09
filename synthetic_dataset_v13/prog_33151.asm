; DESCRIPTION: Renders a black box of size 20x119 starting at (292, 109).
; PLAN: r0=292(x), r1=109(y), r2=20(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 109
LDI r2, 20
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
