; DESCRIPTION: Renders a yellow box of size 115x112 starting at (212, 84).
; PLAN: r0=212(x), r1=84(y), r2=115(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 84
LDI r2, 115
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
