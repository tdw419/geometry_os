; DESCRIPTION: Renders a black box of size 24x43 starting at (322, 207).
; PLAN: r0=322(x), r1=207(y), r2=24(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 207
LDI r2, 24
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
