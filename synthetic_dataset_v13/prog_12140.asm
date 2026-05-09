; DESCRIPTION: Renders a purple box of size 59x51 starting at (425, 151).
; PLAN: r0=425(x), r1=151(y), r2=59(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 151
LDI r2, 59
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
