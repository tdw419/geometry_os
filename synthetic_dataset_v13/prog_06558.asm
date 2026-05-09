; DESCRIPTION: Renders a yellow box of size 81x31 starting at (399, 56).
; PLAN: r0=399(x), r1=56(y), r2=81(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 56
LDI r2, 81
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
