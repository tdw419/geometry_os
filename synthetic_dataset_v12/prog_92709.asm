; DESCRIPTION: Renders a black box of size 103x43 starting at (73, 22).
; PLAN: r0=73(x), r1=22(y), r2=103(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 22
LDI r2, 103
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
