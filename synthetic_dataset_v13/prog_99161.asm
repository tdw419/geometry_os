; DESCRIPTION: Draws a white line from (363, 125) to (251, 209).
; PLAN: r0=363(x1), r1=125(y1), r2=251(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 125
LDI r2, 251
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
