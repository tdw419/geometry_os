; DESCRIPTION: Draws a white line from (362, 89) to (427, 209).
; PLAN: r0=362(x1), r1=89(y1), r2=427(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 89
LDI r2, 427
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
