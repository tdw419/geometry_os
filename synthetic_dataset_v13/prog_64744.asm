; DESCRIPTION: Draws a purple line from (217, 21) to (13, 208).
; PLAN: r0=217(x1), r1=21(y1), r2=13(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 21
LDI r2, 13
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
