; DESCRIPTION: Renders a yellow box of size 119x89 starting at (163, 160).
; PLAN: r0=163(x), r1=160(y), r2=119(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 160
LDI r2, 119
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
