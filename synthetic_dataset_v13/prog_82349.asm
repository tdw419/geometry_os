; DESCRIPTION: Places a yellow circle of radius 12 at center (59, 169).
; PLAN: r0=59(x), r1=169(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 169
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
