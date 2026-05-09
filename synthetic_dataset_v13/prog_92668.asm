; DESCRIPTION: Renders a yellow box of size 15x92 starting at (123, 136).
; PLAN: r0=123(x), r1=136(y), r2=15(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 136
LDI r2, 15
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
