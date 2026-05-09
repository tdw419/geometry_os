; DESCRIPTION: Renders a black box of size 80x100 starting at (311, 14).
; PLAN: r0=311(x), r1=14(y), r2=80(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 14
LDI r2, 80
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
