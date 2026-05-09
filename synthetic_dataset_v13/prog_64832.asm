; DESCRIPTION: Renders a green line between points (186, 79) and (277, 80).
; PLAN: r0=186(x1), r1=79(y1), r2=277(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 79
LDI r2, 277
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
