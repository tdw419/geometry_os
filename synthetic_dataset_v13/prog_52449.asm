; DESCRIPTION: Draws a white line from (381, 185) to (452, 26).
; PLAN: r0=381(x1), r1=185(y1), r2=452(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 185
LDI r2, 452
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
