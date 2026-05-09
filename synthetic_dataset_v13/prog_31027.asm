; DESCRIPTION: Renders a black box of size 38x89 starting at (131, 115).
; PLAN: r0=131(x), r1=115(y), r2=38(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 115
LDI r2, 38
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
