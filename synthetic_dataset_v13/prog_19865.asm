; DESCRIPTION: Renders a yellow box of size 40x51 starting at (293, 49).
; PLAN: r0=293(x), r1=49(y), r2=40(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 49
LDI r2, 40
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
