; DESCRIPTION: Renders a green line between points (423, 47) and (373, 188).
; PLAN: r0=423(x1), r1=47(y1), r2=373(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 47
LDI r2, 373
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
