; DESCRIPTION: Draws a magenta line from (249, 252) to (367, 54).
; PLAN: r0=249(x1), r1=252(y1), r2=367(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 252
LDI r2, 367
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
