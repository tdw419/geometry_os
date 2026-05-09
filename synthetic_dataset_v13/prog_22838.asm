; DESCRIPTION: Renders a black box of size 24x43 starting at (27, 129).
; PLAN: r0=27(x), r1=129(y), r2=24(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 129
LDI r2, 24
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
