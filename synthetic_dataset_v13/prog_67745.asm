; DESCRIPTION: Renders a white box of size 117x41 starting at (68, 60).
; PLAN: r0=68(x), r1=60(y), r2=117(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 60
LDI r2, 117
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
