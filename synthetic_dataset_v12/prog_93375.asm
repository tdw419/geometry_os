; DESCRIPTION: Renders a purple box of size 96x41 starting at (218, 72).
; PLAN: r0=218(x), r1=72(y), r2=96(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 72
LDI r2, 96
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
