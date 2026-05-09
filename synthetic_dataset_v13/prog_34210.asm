; DESCRIPTION: Renders a white box of size 41x63 starting at (170, 75).
; PLAN: r0=170(x), r1=75(y), r2=41(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 75
LDI r2, 41
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
