; DESCRIPTION: Renders a blue box of size 20x51 starting at (133, 173).
; PLAN: r0=133(x), r1=173(y), r2=20(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 173
LDI r2, 20
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
