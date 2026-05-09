; DESCRIPTION: Draws a purple line from (241, 31) to (91, 189).
; PLAN: r0=241(x1), r1=31(y1), r2=91(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 31
LDI r2, 91
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
