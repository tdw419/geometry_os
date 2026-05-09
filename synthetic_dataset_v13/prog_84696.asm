; DESCRIPTION: Draws a purple line from (406, 33) to (13, 251).
; PLAN: r0=406(x1), r1=33(y1), r2=13(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 33
LDI r2, 13
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
