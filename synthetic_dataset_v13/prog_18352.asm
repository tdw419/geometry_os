; DESCRIPTION: Draws a white line from (89, 52) to (208, 109).
; PLAN: r0=89(x1), r1=52(y1), r2=208(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 52
LDI r2, 208
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
