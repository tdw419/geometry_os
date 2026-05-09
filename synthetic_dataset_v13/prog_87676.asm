; DESCRIPTION: Renders a blue box of size 56x41 starting at (200, 43).
; PLAN: r0=200(x), r1=43(y), r2=56(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 43
LDI r2, 56
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
