; DESCRIPTION: Renders a green box of size 15x51 starting at (35, 196).
; PLAN: r0=35(x), r1=196(y), r2=15(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 196
LDI r2, 15
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
