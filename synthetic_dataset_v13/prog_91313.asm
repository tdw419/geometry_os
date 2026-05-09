; DESCRIPTION: Renders a yellow box of size 80x95 starting at (37, 69).
; PLAN: r0=37(x), r1=69(y), r2=80(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 69
LDI r2, 80
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
