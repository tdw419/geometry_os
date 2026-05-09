; DESCRIPTION: Renders a purple box of size 41x52 starting at (292, 116).
; PLAN: r0=292(x), r1=116(y), r2=41(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 116
LDI r2, 41
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
