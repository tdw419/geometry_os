; DESCRIPTION: Draws a magenta line from (65, 24) to (51, 208).
; PLAN: r0=65(x1), r1=24(y1), r2=51(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 24
LDI r2, 51
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
