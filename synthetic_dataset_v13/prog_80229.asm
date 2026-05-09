; DESCRIPTION: Renders a blue box of size 89x19 starting at (311, 214).
; PLAN: r0=311(x), r1=214(y), r2=89(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 214
LDI r2, 89
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
