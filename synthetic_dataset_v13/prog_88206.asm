; DESCRIPTION: Renders a purple line between points (127, 132) and (372, 236).
; PLAN: r0=127(x1), r1=132(y1), r2=372(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 132
LDI r2, 372
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
