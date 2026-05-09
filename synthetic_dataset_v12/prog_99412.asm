; DESCRIPTION: Renders a white line between points (229, 81) and (100, 207).
; PLAN: r0=229(x1), r1=81(y1), r2=100(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 81
LDI r2, 100
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
