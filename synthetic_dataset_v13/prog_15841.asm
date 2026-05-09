; DESCRIPTION: Renders a black box of size 81x96 starting at (395, 68).
; PLAN: r0=395(x), r1=68(y), r2=81(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 68
LDI r2, 81
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
