; DESCRIPTION: Draws a white line from (453, 147) to (100, 120).
; PLAN: r0=453(x1), r1=147(y1), r2=100(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 147
LDI r2, 100
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
