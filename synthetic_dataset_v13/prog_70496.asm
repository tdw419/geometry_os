; DESCRIPTION: Renders a purple line between points (107, 79) and (144, 117).
; PLAN: r0=107(x1), r1=79(y1), r2=144(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 79
LDI r2, 144
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
