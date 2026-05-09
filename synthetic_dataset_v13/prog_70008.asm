; DESCRIPTION: Renders a blue box of size 51x20 starting at (221, 9).
; PLAN: r0=221(x), r1=9(y), r2=51(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 9
LDI r2, 51
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
