; DESCRIPTION: Renders a purple box of size 22x51 starting at (408, 3).
; PLAN: r0=408(x), r1=3(y), r2=22(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 3
LDI r2, 22
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
