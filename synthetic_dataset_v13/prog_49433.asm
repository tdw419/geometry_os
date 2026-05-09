; DESCRIPTION: Renders a purple line between points (431, 150) and (444, 251).
; PLAN: r0=431(x1), r1=150(y1), r2=444(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 150
LDI r2, 444
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
