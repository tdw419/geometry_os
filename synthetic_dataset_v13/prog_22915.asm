; DESCRIPTION: Renders a blue box of size 35x93 starting at (399, 92).
; PLAN: r0=399(x), r1=92(y), r2=35(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 92
LDI r2, 35
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
