; DESCRIPTION: Renders a yellow box of size 69x118 starting at (344, 23).
; PLAN: r0=344(x), r1=23(y), r2=69(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 23
LDI r2, 69
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
