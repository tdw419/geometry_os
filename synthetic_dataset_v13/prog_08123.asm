; DESCRIPTION: Renders a blue box of size 81x51 starting at (404, 119).
; PLAN: r0=404(x), r1=119(y), r2=81(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 119
LDI r2, 81
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
