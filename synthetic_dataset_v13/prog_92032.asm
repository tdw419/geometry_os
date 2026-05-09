; DESCRIPTION: Places a yellow circle of radius 58 at center (448, 174).
; PLAN: r0=448(x), r1=174(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 174
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
