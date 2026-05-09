; DESCRIPTION: Renders a yellow box of size 11x114 starting at (421, 107).
; PLAN: r0=421(x), r1=107(y), r2=11(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 107
LDI r2, 11
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
