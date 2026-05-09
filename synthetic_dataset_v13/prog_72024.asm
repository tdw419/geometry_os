; DESCRIPTION: Renders a green box of size 17x58 starting at (149, 136).
; PLAN: r0=149(x), r1=136(y), r2=17(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 136
LDI r2, 17
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
