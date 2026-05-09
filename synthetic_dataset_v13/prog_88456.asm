; DESCRIPTION: Places a purple line segment connecting (48, 174) to (293, 127).
; PLAN: r0=48(x1), r1=174(y1), r2=293(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 174
LDI r2, 293
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
