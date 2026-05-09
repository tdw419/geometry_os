; DESCRIPTION: Renders a yellow box of size 47x84 starting at (189, 149).
; PLAN: r0=189(x), r1=149(y), r2=47(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 149
LDI r2, 47
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
