; DESCRIPTION: Renders a black box of size 22x96 starting at (379, 25).
; PLAN: r0=379(x), r1=25(y), r2=22(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 25
LDI r2, 22
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
