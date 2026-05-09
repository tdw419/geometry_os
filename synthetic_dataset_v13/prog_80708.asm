; DESCRIPTION: Draws a white line from (453, 204) to (452, 82).
; PLAN: r0=453(x1), r1=204(y1), r2=452(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 204
LDI r2, 452
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
