; DESCRIPTION: Draws a purple line from (474, 199) to (457, 91).
; PLAN: r0=474(x1), r1=199(y1), r2=457(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 199
LDI r2, 457
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
