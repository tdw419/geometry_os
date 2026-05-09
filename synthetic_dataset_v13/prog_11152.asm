; DESCRIPTION: Renders a yellow box of size 80x114 starting at (327, 43).
; PLAN: r0=327(x), r1=43(y), r2=80(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 43
LDI r2, 80
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
