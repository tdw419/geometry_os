; DESCRIPTION: Draws a magenta line from (50, 145) to (347, 76).
; PLAN: r0=50(x1), r1=145(y1), r2=347(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 145
LDI r2, 347
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
