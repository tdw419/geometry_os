; DESCRIPTION: Places a magenta line segment connecting (496, 251) to (487, 121).
; PLAN: r0=496(x1), r1=251(y1), r2=487(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 251
LDI r2, 487
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
