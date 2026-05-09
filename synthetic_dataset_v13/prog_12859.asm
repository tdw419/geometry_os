; DESCRIPTION: Renders a black box of size 64x89 starting at (304, 58).
; PLAN: r0=304(x), r1=58(y), r2=64(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 58
LDI r2, 64
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
