; DESCRIPTION: Places a yellow circle of radius 22 at center (50, 124).
; PLAN: r0=50(x), r1=124(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 124
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
