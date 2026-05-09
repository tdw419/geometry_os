; DESCRIPTION: Renders a green box of size 119x89 starting at (17, 16).
; PLAN: r0=17(x), r1=16(y), r2=119(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 16
LDI r2, 119
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
