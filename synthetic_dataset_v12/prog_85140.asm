; DESCRIPTION: Renders a blue box of size 51x52 starting at (8, 92).
; PLAN: r0=8(x), r1=92(y), r2=51(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 92
LDI r2, 51
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
