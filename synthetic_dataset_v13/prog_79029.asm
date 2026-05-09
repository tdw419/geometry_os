; DESCRIPTION: Renders a blue box of size 14x41 starting at (200, 160).
; PLAN: r0=200(x), r1=160(y), r2=14(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 160
LDI r2, 14
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
