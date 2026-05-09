; DESCRIPTION: Renders a purple box of size 51x77 starting at (53, 104).
; PLAN: r0=53(x), r1=104(y), r2=51(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 104
LDI r2, 51
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
