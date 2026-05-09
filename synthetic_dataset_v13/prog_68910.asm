; DESCRIPTION: Draws a purple line from (91, 16) to (423, 138).
; PLAN: r0=91(x1), r1=16(y1), r2=423(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 16
LDI r2, 423
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
