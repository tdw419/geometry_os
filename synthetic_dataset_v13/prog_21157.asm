; DESCRIPTION: Draws a green line from (51, 250) to (183, 241).
; PLAN: r0=51(x1), r1=250(y1), r2=183(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 250
LDI r2, 183
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
