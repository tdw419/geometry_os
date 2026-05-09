; DESCRIPTION: Renders a black box of size 35x20 starting at (177, 121).
; PLAN: r0=177(x), r1=121(y), r2=35(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 121
LDI r2, 35
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
