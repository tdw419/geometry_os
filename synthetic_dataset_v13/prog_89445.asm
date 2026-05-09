; DESCRIPTION: Renders a yellow box of size 23x34 starting at (302, 102).
; PLAN: r0=302(x), r1=102(y), r2=23(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 102
LDI r2, 23
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
