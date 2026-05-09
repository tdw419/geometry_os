; DESCRIPTION: Renders a yellow box of size 114x92 starting at (274, 129).
; PLAN: r0=274(x), r1=129(y), r2=114(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 129
LDI r2, 114
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
