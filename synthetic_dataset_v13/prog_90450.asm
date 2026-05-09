; DESCRIPTION: Renders a black box of size 93x30 starting at (323, 106).
; PLAN: r0=323(x), r1=106(y), r2=93(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 106
LDI r2, 93
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
