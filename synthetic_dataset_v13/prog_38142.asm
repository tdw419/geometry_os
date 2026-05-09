; DESCRIPTION: Renders a yellow box of size 58x40 starting at (307, 99).
; PLAN: r0=307(x), r1=99(y), r2=58(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 99
LDI r2, 58
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
