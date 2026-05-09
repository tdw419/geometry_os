; DESCRIPTION: Renders a black box of size 33x17 starting at (230, 51).
; PLAN: r0=230(x), r1=51(y), r2=33(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 51
LDI r2, 33
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
