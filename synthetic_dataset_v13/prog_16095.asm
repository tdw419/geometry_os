; DESCRIPTION: Renders a green box of size 51x46 starting at (266, 53).
; PLAN: r0=266(x), r1=53(y), r2=51(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 53
LDI r2, 51
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
