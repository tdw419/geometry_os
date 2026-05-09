; DESCRIPTION: Renders a black box of size 31x17 starting at (379, 74).
; PLAN: r0=379(x), r1=74(y), r2=31(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 74
LDI r2, 31
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
