; DESCRIPTION: Draws a magenta line from (273, 57) to (438, 17).
; PLAN: r0=273(x1), r1=57(y1), r2=438(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 57
LDI r2, 438
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
