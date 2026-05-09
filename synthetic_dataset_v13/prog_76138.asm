; DESCRIPTION: Renders a purple line between points (392, 133) and (470, 80).
; PLAN: r0=392(x1), r1=133(y1), r2=470(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 133
LDI r2, 470
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
