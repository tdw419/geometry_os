; DESCRIPTION: Draws a blue line from (183, 226) to (331, 97).
; PLAN: r0=183(x1), r1=226(y1), r2=331(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 226
LDI r2, 331
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
