; DESCRIPTION: Renders a yellow box of size 117x75 starting at (232, 105).
; PLAN: r0=232(x), r1=105(y), r2=117(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 105
LDI r2, 117
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
