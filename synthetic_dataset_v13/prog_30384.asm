; DESCRIPTION: Renders a black box of size 53x11 starting at (292, 125).
; PLAN: r0=292(x), r1=125(y), r2=53(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 125
LDI r2, 53
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
