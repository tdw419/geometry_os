; DESCRIPTION: Draws a magenta line from (431, 252) to (419, 174).
; PLAN: r0=431(x1), r1=252(y1), r2=419(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 252
LDI r2, 419
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
