; DESCRIPTION: Draws a white line from (419, 126) to (105, 241).
; PLAN: r0=419(x1), r1=126(y1), r2=105(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 126
LDI r2, 105
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
