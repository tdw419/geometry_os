; DESCRIPTION: Renders a green box of size 51x19 starting at (230, 158).
; PLAN: r0=230(x), r1=158(y), r2=51(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 158
LDI r2, 51
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
