; DESCRIPTION: Renders a yellow box of size 49x101 starting at (12, 92).
; PLAN: r0=12(x), r1=92(y), r2=49(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 92
LDI r2, 49
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
