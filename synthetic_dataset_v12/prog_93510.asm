; DESCRIPTION: Places a yellow circle of radius 27 at center (162, 100).
; PLAN: r0=162(x), r1=100(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 100
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
