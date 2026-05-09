; DESCRIPTION: Places a green line segment connecting (36, 103) to (421, 17).
; PLAN: r0=36(x1), r1=103(y1), r2=421(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 103
LDI r2, 421
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
