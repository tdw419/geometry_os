; DESCRIPTION: Renders a yellow box of size 40x43 starting at (399, 106).
; PLAN: r0=399(x), r1=106(y), r2=40(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 106
LDI r2, 40
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
