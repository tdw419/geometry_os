; DESCRIPTION: Renders a yellow box of size 66x22 starting at (282, 217).
; PLAN: r0=282(x), r1=217(y), r2=66(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 217
LDI r2, 66
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
