; DESCRIPTION: Renders a yellow box of size 97x100 starting at (159, 12).
; PLAN: r0=159(x), r1=12(y), r2=97(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 12
LDI r2, 97
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
