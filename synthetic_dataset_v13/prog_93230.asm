; DESCRIPTION: Renders a green box of size 100x81 starting at (11, 17).
; PLAN: r0=11(x), r1=17(y), r2=100(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 17
LDI r2, 100
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
