; DESCRIPTION: Renders a yellow box of size 80x68 starting at (122, 100).
; PLAN: r0=122(x), r1=100(y), r2=80(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 100
LDI r2, 80
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
