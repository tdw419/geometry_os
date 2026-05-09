; DESCRIPTION: Renders a blue box of size 22x51 starting at (76, 6).
; PLAN: r0=76(x), r1=6(y), r2=22(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 6
LDI r2, 22
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
