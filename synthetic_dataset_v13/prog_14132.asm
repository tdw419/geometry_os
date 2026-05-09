; DESCRIPTION: Draws a purple line from (328, 241) to (225, 247).
; PLAN: r0=328(x1), r1=241(y1), r2=225(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 241
LDI r2, 225
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
