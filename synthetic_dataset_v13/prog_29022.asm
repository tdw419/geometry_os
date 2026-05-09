; DESCRIPTION: Places a yellow circle of radius 27 at center (196, 104).
; PLAN: r0=196(x), r1=104(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 104
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
