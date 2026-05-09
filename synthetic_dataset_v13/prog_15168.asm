; DESCRIPTION: Renders a purple line between points (342, 80) and (394, 250).
; PLAN: r0=342(x1), r1=80(y1), r2=394(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 80
LDI r2, 394
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
