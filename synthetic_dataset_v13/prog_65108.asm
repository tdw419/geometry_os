; DESCRIPTION: Renders a yellow box of size 30x51 starting at (6, 142).
; PLAN: r0=6(x), r1=142(y), r2=30(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 142
LDI r2, 30
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
