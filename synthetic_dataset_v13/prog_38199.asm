; DESCRIPTION: Renders a purple line between points (196, 91) and (503, 47).
; PLAN: r0=196(x1), r1=91(y1), r2=503(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 91
LDI r2, 503
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
