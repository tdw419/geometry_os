; DESCRIPTION: Renders a black box of size 47x34 starting at (265, 217).
; PLAN: r0=265(x), r1=217(y), r2=47(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 217
LDI r2, 47
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
