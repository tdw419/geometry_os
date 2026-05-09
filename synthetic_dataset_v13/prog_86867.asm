; DESCRIPTION: Renders a white box of size 41x91 starting at (73, 9).
; PLAN: r0=73(x), r1=9(y), r2=41(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 9
LDI r2, 41
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
