; DESCRIPTION: Places a yellow circle of radius 36 at center (142, 182).
; PLAN: r0=142(x), r1=182(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 182
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
