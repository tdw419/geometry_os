; DESCRIPTION: Draws a purple line from (26, 151) to (132, 56).
; PLAN: r0=26(x1), r1=151(y1), r2=132(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 151
LDI r2, 132
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
