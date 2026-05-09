; DESCRIPTION: Renders a blue box of size 41x106 starting at (83, 68).
; PLAN: r0=83(x), r1=68(y), r2=41(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 68
LDI r2, 41
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
