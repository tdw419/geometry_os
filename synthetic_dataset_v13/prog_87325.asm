; DESCRIPTION: Renders a black box of size 93x110 starting at (361, 102).
; PLAN: r0=361(x), r1=102(y), r2=93(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 102
LDI r2, 93
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
