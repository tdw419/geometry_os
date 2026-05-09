; DESCRIPTION: Renders a white line between points (150, 200) and (169, 183).
; PLAN: r0=150(x1), r1=200(y1), r2=169(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 200
LDI r2, 169
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
