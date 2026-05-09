; DESCRIPTION: Draws a white line from (159, 174) to (342, 58).
; PLAN: r0=159(x1), r1=174(y1), r2=342(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 174
LDI r2, 342
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
