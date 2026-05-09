; DESCRIPTION: Renders a yellow box of size 53x20 starting at (221, 100).
; PLAN: r0=221(x), r1=100(y), r2=53(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 100
LDI r2, 53
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
