; DESCRIPTION: Renders a yellow box of size 98x89 starting at (182, 110).
; PLAN: r0=182(x), r1=110(y), r2=98(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 110
LDI r2, 98
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
