; DESCRIPTION: Renders a black box of size 10x102 starting at (429, 62).
; PLAN: r0=429(x), r1=62(y), r2=10(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 62
LDI r2, 10
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
