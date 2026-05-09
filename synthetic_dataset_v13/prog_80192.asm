; DESCRIPTION: Renders a blue box of size 93x51 starting at (291, 125).
; PLAN: r0=291(x), r1=125(y), r2=93(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 125
LDI r2, 93
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
