; DESCRIPTION: Places a yellow circle of radius 37 at center (80, 210).
; PLAN: r0=80(x), r1=210(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 210
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
