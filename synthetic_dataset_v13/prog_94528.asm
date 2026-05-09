; DESCRIPTION: Renders a blue box of size 79x51 starting at (326, 20).
; PLAN: r0=326(x), r1=20(y), r2=79(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 20
LDI r2, 79
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
