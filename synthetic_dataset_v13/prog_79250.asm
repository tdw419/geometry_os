; DESCRIPTION: Places a yellow line segment connecting (44, 26) to (235, 193).
; PLAN: r0=44(x1), r1=26(y1), r2=235(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 26
LDI r2, 235
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
