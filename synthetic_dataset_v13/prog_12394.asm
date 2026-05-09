; DESCRIPTION: Renders a purple box of size 61x14 starting at (250, 41).
; PLAN: r0=250(x), r1=41(y), r2=61(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 41
LDI r2, 61
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
