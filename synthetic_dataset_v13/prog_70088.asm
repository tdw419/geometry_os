; DESCRIPTION: Draws a purple line from (66, 229) to (87, 243).
; PLAN: r0=66(x1), r1=229(y1), r2=87(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 229
LDI r2, 87
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
