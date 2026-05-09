; DESCRIPTION: Renders a green box of size 78x46 starting at (306, 81).
; PLAN: r0=306(x), r1=81(y), r2=78(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 81
LDI r2, 78
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
