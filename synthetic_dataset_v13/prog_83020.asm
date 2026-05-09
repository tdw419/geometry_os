; DESCRIPTION: Renders a blue box of size 51x19 starting at (361, 102).
; PLAN: r0=361(x), r1=102(y), r2=51(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 102
LDI r2, 51
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
