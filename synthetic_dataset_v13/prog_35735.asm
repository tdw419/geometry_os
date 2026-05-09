; DESCRIPTION: Places a yellow line segment connecting (100, 245) to (496, 27).
; PLAN: r0=100(x1), r1=245(y1), r2=496(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 245
LDI r2, 496
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
