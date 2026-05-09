; DESCRIPTION: Draws a white line from (33, 159) to (362, 145).
; PLAN: r0=33(x1), r1=159(y1), r2=362(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 159
LDI r2, 362
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
