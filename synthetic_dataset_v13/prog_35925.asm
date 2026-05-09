; DESCRIPTION: Renders a yellow box of size 48x101 starting at (37, 153).
; PLAN: r0=37(x), r1=153(y), r2=48(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 153
LDI r2, 48
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
