; DESCRIPTION: Places a green line segment connecting (346, 211) to (496, 127).
; PLAN: r0=346(x1), r1=211(y1), r2=496(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 211
LDI r2, 496
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
