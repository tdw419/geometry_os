; DESCRIPTION: Renders a yellow box of size 40x98 starting at (424, 105).
; PLAN: r0=424(x), r1=105(y), r2=40(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 105
LDI r2, 40
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
