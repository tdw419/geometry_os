; DESCRIPTION: Draws a purple line from (288, 125) to (213, 250).
; PLAN: r0=288(x1), r1=125(y1), r2=213(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 125
LDI r2, 213
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
