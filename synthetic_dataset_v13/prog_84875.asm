; DESCRIPTION: Places a yellow circle of radius 36 at center (149, 186).
; PLAN: r0=149(x), r1=186(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 186
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
