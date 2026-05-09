; DESCRIPTION: Renders a green box of size 30x51 starting at (182, 136).
; PLAN: r0=182(x), r1=136(y), r2=30(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 136
LDI r2, 30
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
