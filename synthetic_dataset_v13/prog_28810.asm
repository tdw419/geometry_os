; DESCRIPTION: Renders a blue box of size 64x92 starting at (81, 138).
; PLAN: r0=81(x), r1=138(y), r2=64(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 138
LDI r2, 64
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
