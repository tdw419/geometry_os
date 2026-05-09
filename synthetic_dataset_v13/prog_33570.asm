; DESCRIPTION: Renders a yellow box of size 117x62 starting at (131, 34).
; PLAN: r0=131(x), r1=34(y), r2=117(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 34
LDI r2, 117
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
