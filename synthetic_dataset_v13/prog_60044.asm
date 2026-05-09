; DESCRIPTION: Renders a yellow box of size 19x18 starting at (102, 89).
; PLAN: r0=102(x), r1=89(y), r2=19(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 89
LDI r2, 19
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
