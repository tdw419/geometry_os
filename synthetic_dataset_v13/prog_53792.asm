; DESCRIPTION: Draws a white line from (419, 249) to (85, 52).
; PLAN: r0=419(x1), r1=249(y1), r2=85(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 249
LDI r2, 85
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
