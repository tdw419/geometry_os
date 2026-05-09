; DESCRIPTION: Renders a yellow box of size 56x106 starting at (141, 35).
; PLAN: r0=141(x), r1=35(y), r2=56(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 35
LDI r2, 56
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
