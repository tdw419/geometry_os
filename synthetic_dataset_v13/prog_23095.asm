; DESCRIPTION: Draws a purple line from (150, 17) to (321, 196).
; PLAN: r0=150(x1), r1=17(y1), r2=321(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 17
LDI r2, 321
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
