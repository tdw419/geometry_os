; DESCRIPTION: Renders a yellow box of size 19x37 starting at (73, 99).
; PLAN: r0=73(x), r1=99(y), r2=19(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 99
LDI r2, 19
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
