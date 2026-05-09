; DESCRIPTION: Renders a green box of size 89x100 starting at (76, 66).
; PLAN: r0=76(x), r1=66(y), r2=89(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 66
LDI r2, 89
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
