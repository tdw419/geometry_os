; DESCRIPTION: Places a yellow circle of radius 45 at center (328, 92).
; PLAN: r0=328(x), r1=92(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 92
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
