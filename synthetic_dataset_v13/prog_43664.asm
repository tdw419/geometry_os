; DESCRIPTION: Draws a purple line from (105, 4) to (46, 189).
; PLAN: r0=105(x1), r1=4(y1), r2=46(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 4
LDI r2, 46
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
