; DESCRIPTION: Renders a yellow box of size 50x118 starting at (3, 23).
; PLAN: r0=3(x), r1=23(y), r2=50(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 23
LDI r2, 50
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
