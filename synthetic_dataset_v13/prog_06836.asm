; DESCRIPTION: Draws a white line from (400, 241) to (391, 250).
; PLAN: r0=400(x1), r1=241(y1), r2=391(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 241
LDI r2, 391
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
