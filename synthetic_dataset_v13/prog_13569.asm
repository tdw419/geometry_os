; DESCRIPTION: Renders a white box of size 41x14 starting at (206, 157).
; PLAN: r0=206(x), r1=157(y), r2=41(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 157
LDI r2, 41
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
