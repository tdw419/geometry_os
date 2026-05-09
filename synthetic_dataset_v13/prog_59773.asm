; DESCRIPTION: Renders a purple line between points (393, 21) and (198, 162).
; PLAN: r0=393(x1), r1=21(y1), r2=198(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 21
LDI r2, 198
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
