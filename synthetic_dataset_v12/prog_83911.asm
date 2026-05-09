; DESCRIPTION: Draws a magenta line from (365, 229) to (145, 200).
; PLAN: r0=365(x1), r1=229(y1), r2=145(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 229
LDI r2, 145
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
