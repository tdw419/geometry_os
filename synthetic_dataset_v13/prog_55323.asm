; DESCRIPTION: Places a purple line segment connecting (75, 253) to (229, 120).
; PLAN: r0=75(x1), r1=253(y1), r2=229(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 253
LDI r2, 229
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
