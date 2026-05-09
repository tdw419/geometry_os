; DESCRIPTION: Places a yellow circle of radius 50 at center (122, 138).
; PLAN: r0=122(x), r1=138(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 138
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
