; DESCRIPTION: Renders a yellow box of size 117x94 starting at (24, 138).
; PLAN: r0=24(x), r1=138(y), r2=117(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 138
LDI r2, 117
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
