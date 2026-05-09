; DESCRIPTION: Renders a black box of size 81x21 starting at (207, 106).
; PLAN: r0=207(x), r1=106(y), r2=81(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 106
LDI r2, 81
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
