; DESCRIPTION: Places a red line segment connecting (140, 226) to (489, 193).
; PLAN: r0=140(x1), r1=226(y1), r2=489(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 226
LDI r2, 489
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
