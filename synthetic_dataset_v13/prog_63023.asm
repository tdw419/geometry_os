; DESCRIPTION: Renders a yellow box of size 17x12 starting at (62, 149).
; PLAN: r0=62(x), r1=149(y), r2=17(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 149
LDI r2, 17
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
