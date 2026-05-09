; DESCRIPTION: Renders a yellow box of size 118x46 starting at (345, 33).
; PLAN: r0=345(x), r1=33(y), r2=118(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 33
LDI r2, 118
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
