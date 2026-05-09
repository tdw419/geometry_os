; DESCRIPTION: Places a yellow circle of radius 27 at center (428, 56).
; PLAN: r0=428(x), r1=56(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 56
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
