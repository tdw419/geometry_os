; DESCRIPTION: Renders a yellow box of size 107x51 starting at (357, 151).
; PLAN: r0=357(x), r1=151(y), r2=107(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 151
LDI r2, 107
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
