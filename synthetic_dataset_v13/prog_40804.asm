; DESCRIPTION: Draws a purple line from (145, 196) to (365, 229).
; PLAN: r0=145(x1), r1=196(y1), r2=365(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 196
LDI r2, 365
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
