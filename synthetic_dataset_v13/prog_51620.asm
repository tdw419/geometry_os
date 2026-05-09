; DESCRIPTION: Draws a yellow line from (51, 174) to (162, 131).
; PLAN: r0=51(x1), r1=174(y1), r2=162(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 174
LDI r2, 162
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
