; DESCRIPTION: Renders a green box of size 89x57 starting at (252, 81).
; PLAN: r0=252(x), r1=81(y), r2=89(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 81
LDI r2, 89
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
