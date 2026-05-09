; DESCRIPTION: Renders a white box of size 113x109 starting at (211, 41).
; PLAN: r0=211(x), r1=41(y), r2=113(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 41
LDI r2, 113
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
