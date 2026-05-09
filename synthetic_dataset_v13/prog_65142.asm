; DESCRIPTION: Draws a green line from (23, 51) to (106, 118).
; PLAN: r0=23(x1), r1=51(y1), r2=106(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 51
LDI r2, 106
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
