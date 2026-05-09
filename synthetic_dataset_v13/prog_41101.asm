; DESCRIPTION: Renders a black box of size 28x101 starting at (396, 123).
; PLAN: r0=396(x), r1=123(y), r2=28(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 123
LDI r2, 28
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
