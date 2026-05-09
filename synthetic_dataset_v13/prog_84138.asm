; DESCRIPTION: Renders a yellow box of size 89x98 starting at (373, 18).
; PLAN: r0=373(x), r1=18(y), r2=89(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 18
LDI r2, 89
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
