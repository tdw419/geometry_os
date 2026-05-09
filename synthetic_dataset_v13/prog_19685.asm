; DESCRIPTION: Places a purple line segment connecting (439, 247) to (459, 208).
; PLAN: r0=439(x1), r1=247(y1), r2=459(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 247
LDI r2, 459
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
