; DESCRIPTION: Renders a purple line between points (205, 144) and (196, 60).
; PLAN: r0=205(x1), r1=144(y1), r2=196(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 144
LDI r2, 196
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
