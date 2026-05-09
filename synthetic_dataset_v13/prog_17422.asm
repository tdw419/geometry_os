; DESCRIPTION: Renders a purple box of size 33x51 starting at (425, 169).
; PLAN: r0=425(x), r1=169(y), r2=33(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 169
LDI r2, 33
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
