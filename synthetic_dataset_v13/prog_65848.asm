; DESCRIPTION: Renders a yellow box of size 101x95 starting at (34, 100).
; PLAN: r0=34(x), r1=100(y), r2=101(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 100
LDI r2, 101
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
