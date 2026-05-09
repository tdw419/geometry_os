; DESCRIPTION: Renders a yellow box of size 31x105 starting at (40, 89).
; PLAN: r0=40(x), r1=89(y), r2=31(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 89
LDI r2, 31
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
