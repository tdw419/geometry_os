; DESCRIPTION: Renders a black box of size 80x116 starting at (421, 114).
; PLAN: r0=421(x), r1=114(y), r2=80(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 114
LDI r2, 80
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
