; DESCRIPTION: Draws a magenta line from (27, 97) to (250, 51).
; PLAN: r0=27(x1), r1=97(y1), r2=250(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 97
LDI r2, 250
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
