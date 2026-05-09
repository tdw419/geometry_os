; DESCRIPTION: Draws a white line from (381, 237) to (471, 112).
; PLAN: r0=381(x1), r1=237(y1), r2=471(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 237
LDI r2, 471
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
