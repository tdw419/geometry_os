; DESCRIPTION: Renders a yellow box of size 11x41 starting at (246, 172).
; PLAN: r0=246(x), r1=172(y), r2=11(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 172
LDI r2, 11
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
