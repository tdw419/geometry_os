; DESCRIPTION: Places a white line segment connecting (388, 225) to (506, 87).
; PLAN: r0=388(x1), r1=225(y1), r2=506(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 225
LDI r2, 506
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
