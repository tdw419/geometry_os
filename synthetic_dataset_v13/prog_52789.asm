; DESCRIPTION: Places a yellow line segment connecting (505, 226) to (378, 193).
; PLAN: r0=505(x1), r1=226(y1), r2=378(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 226
LDI r2, 378
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
