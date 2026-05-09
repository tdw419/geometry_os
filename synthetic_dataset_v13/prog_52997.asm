; DESCRIPTION: Renders a black box of size 91x74 starting at (389, 115).
; PLAN: r0=389(x), r1=115(y), r2=91(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 115
LDI r2, 91
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
