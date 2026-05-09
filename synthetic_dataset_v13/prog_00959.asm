; DESCRIPTION: Renders a blue box of size 60x41 starting at (349, 125).
; PLAN: r0=349(x), r1=125(y), r2=60(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 125
LDI r2, 60
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
