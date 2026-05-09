; DESCRIPTION: Renders a black box of size 25x73 starting at (191, 74).
; PLAN: r0=191(x), r1=74(y), r2=25(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 74
LDI r2, 25
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
