; DESCRIPTION: Renders a purple line between points (198, 91) and (182, 160).
; PLAN: r0=198(x1), r1=91(y1), r2=182(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 91
LDI r2, 182
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
