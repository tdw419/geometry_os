; DESCRIPTION: Places a yellow circle of radius 11 at center (302, 50).
; PLAN: r0=302(x), r1=50(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 50
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
