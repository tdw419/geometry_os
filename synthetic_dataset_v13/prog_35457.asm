; DESCRIPTION: Renders a black box of size 74x95 starting at (429, 49).
; PLAN: r0=429(x), r1=49(y), r2=74(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 49
LDI r2, 74
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
