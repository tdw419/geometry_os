; DESCRIPTION: Draws a white line from (273, 150) to (172, 119).
; PLAN: r0=273(x1), r1=150(y1), r2=172(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 150
LDI r2, 172
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
