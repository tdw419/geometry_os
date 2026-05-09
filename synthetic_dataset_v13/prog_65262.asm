; DESCRIPTION: Renders a purple box of size 41x92 starting at (395, 60).
; PLAN: r0=395(x), r1=60(y), r2=41(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 60
LDI r2, 41
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
