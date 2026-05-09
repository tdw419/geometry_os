; DESCRIPTION: Draws a white line from (427, 35) to (441, 51).
; PLAN: r0=427(x1), r1=35(y1), r2=441(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 35
LDI r2, 441
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
