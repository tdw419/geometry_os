; DESCRIPTION: Draws a magenta line from (229, 103) to (77, 112).
; PLAN: r0=229(x1), r1=103(y1), r2=77(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 103
LDI r2, 77
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
