; DESCRIPTION: Draws a magenta line from (367, 3) to (51, 121).
; PLAN: r0=367(x1), r1=3(y1), r2=51(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 3
LDI r2, 51
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
