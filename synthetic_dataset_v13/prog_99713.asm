; DESCRIPTION: Draws a purple line from (464, 4) to (331, 138).
; PLAN: r0=464(x1), r1=4(y1), r2=331(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 4
LDI r2, 331
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
