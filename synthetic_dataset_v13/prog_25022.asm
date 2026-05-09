; DESCRIPTION: Renders a black box of size 90x81 starting at (153, 1).
; PLAN: r0=153(x), r1=1(y), r2=90(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 1
LDI r2, 90
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
