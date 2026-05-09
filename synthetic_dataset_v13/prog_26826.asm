; DESCRIPTION: Renders a green box of size 51x43 starting at (221, 131).
; PLAN: r0=221(x), r1=131(y), r2=51(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 131
LDI r2, 51
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
