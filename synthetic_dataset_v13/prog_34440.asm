; DESCRIPTION: Renders a yellow box of size 11x102 starting at (119, 23).
; PLAN: r0=119(x), r1=23(y), r2=11(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 23
LDI r2, 11
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
