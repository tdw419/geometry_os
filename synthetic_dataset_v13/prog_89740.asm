; DESCRIPTION: Renders a green box of size 89x118 starting at (241, 50).
; PLAN: r0=241(x), r1=50(y), r2=89(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 50
LDI r2, 89
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
