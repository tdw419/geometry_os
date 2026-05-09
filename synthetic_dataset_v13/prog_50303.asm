; DESCRIPTION: Renders a black box of size 69x82 starting at (14, 51).
; PLAN: r0=14(x), r1=51(y), r2=69(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 51
LDI r2, 69
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
