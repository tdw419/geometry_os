; DESCRIPTION: Renders a black box of size 98x102 starting at (306, 89).
; PLAN: r0=306(x), r1=89(y), r2=98(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 89
LDI r2, 98
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
