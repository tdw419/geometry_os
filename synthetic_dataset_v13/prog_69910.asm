; DESCRIPTION: Renders a black box of size 93x96 starting at (329, 75).
; PLAN: r0=329(x), r1=75(y), r2=93(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 75
LDI r2, 93
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
