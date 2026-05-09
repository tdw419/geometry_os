; DESCRIPTION: Renders a black box of size 115x49 starting at (31, 50).
; PLAN: r0=31(x), r1=50(y), r2=115(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 50
LDI r2, 115
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
