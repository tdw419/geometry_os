; DESCRIPTION: Renders a purple line between points (385, 12) and (174, 152).
; PLAN: r0=385(x1), r1=12(y1), r2=174(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 12
LDI r2, 174
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
