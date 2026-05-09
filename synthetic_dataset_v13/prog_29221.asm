; DESCRIPTION: Renders a white box of size 86x106 starting at (340, 41).
; PLAN: r0=340(x), r1=41(y), r2=86(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 41
LDI r2, 86
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
