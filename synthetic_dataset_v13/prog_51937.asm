; DESCRIPTION: Places a yellow circle of radius 31 at center (215, 92).
; PLAN: r0=215(x), r1=92(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 92
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
