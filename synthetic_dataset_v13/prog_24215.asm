; DESCRIPTION: Renders a blue box of size 45x41 starting at (250, 3).
; PLAN: r0=250(x), r1=3(y), r2=45(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 3
LDI r2, 45
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
