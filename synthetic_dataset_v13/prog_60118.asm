; DESCRIPTION: Places a yellow line segment connecting (361, 137) to (318, 171).
; PLAN: r0=361(x1), r1=137(y1), r2=318(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 137
LDI r2, 318
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
