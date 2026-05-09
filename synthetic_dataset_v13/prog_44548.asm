; DESCRIPTION: Renders a yellow box of size 76x101 starting at (274, 52).
; PLAN: r0=274(x), r1=52(y), r2=76(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 52
LDI r2, 76
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
