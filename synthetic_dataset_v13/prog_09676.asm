; DESCRIPTION: Draws a purple line from (201, 178) to (220, 242).
; PLAN: r0=201(x1), r1=178(y1), r2=220(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 178
LDI r2, 220
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
