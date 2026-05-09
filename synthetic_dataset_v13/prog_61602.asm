; DESCRIPTION: Renders a yellow box of size 58x80 starting at (452, 114).
; PLAN: r0=452(x), r1=114(y), r2=58(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 114
LDI r2, 58
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
