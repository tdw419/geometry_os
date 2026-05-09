; DESCRIPTION: Draws a purple line from (75, 61) to (188, 253).
; PLAN: r0=75(x1), r1=61(y1), r2=188(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 61
LDI r2, 188
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
