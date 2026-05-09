; DESCRIPTION: Renders a black box of size 36x89 starting at (134, 107).
; PLAN: r0=134(x), r1=107(y), r2=36(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 107
LDI r2, 36
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
