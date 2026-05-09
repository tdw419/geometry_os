; DESCRIPTION: Renders a black box of size 112x14 starting at (230, 7).
; PLAN: r0=230(x), r1=7(y), r2=112(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 7
LDI r2, 112
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
