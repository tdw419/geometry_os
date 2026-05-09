; DESCRIPTION: Renders a purple box of size 41x13 starting at (58, 7).
; PLAN: r0=58(x), r1=7(y), r2=41(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 7
LDI r2, 41
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
