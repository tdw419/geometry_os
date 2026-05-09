; DESCRIPTION: Renders a black box of size 114x19 starting at (309, 181).
; PLAN: r0=309(x), r1=181(y), r2=114(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 181
LDI r2, 114
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
