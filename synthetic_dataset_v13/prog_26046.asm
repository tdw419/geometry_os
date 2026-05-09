; DESCRIPTION: Renders a purple line between points (151, 202) and (213, 84).
; PLAN: r0=151(x1), r1=202(y1), r2=213(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 202
LDI r2, 213
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
