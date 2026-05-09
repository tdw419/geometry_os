; DESCRIPTION: Renders a yellow box of size 97x91 starting at (131, 35).
; PLAN: r0=131(x), r1=35(y), r2=97(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 35
LDI r2, 97
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
