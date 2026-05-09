; DESCRIPTION: Draws a purple line from (208, 3) to (63, 255).
; PLAN: r0=208(x1), r1=3(y1), r2=63(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 3
LDI r2, 63
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
