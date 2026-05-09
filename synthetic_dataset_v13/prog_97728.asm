; DESCRIPTION: Places a yellow circle of radius 57 at center (124, 92).
; PLAN: r0=124(x), r1=92(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 92
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
