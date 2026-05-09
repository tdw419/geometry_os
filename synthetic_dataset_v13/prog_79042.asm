; DESCRIPTION: Renders a purple box of size 50x51 starting at (1, 2).
; PLAN: r0=1(x), r1=2(y), r2=50(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 2
LDI r2, 50
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
