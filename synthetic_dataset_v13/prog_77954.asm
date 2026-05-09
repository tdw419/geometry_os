; DESCRIPTION: Renders a yellow box of size 118x113 starting at (139, 110).
; PLAN: r0=139(x), r1=110(y), r2=118(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 110
LDI r2, 118
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
