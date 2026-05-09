; DESCRIPTION: Renders a green box of size 71x106 starting at (289, 110).
; PLAN: r0=289(x), r1=110(y), r2=71(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 110
LDI r2, 71
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
