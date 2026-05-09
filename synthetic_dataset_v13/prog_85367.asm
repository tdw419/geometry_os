; DESCRIPTION: Renders a yellow box of size 101x109 starting at (138, 88).
; PLAN: r0=138(x), r1=88(y), r2=101(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 88
LDI r2, 101
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
