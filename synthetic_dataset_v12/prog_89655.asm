; DESCRIPTION: Renders a green line between points (251, 155) and (221, 152).
; PLAN: r0=251(x1), r1=155(y1), r2=221(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 155
LDI r2, 221
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
