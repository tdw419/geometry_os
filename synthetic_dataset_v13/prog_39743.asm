; DESCRIPTION: Renders a blue box of size 81x28 starting at (92, 129).
; PLAN: r0=92(x), r1=129(y), r2=81(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 129
LDI r2, 81
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
