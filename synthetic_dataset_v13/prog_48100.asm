; DESCRIPTION: Renders a purple line between points (431, 198) and (502, 117).
; PLAN: r0=431(x1), r1=198(y1), r2=502(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 198
LDI r2, 502
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
