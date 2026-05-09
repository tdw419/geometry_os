; DESCRIPTION: Renders a white line between points (273, 38) and (331, 160).
; PLAN: r0=273(x1), r1=38(y1), r2=331(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 38
LDI r2, 331
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
