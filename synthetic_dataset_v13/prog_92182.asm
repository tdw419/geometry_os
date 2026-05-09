; DESCRIPTION: Places a purple line segment connecting (178, 6) to (367, 204).
; PLAN: r0=178(x1), r1=6(y1), r2=367(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 6
LDI r2, 367
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
