; DESCRIPTION: Draws a purple line from (91, 222) to (279, 172).
; PLAN: r0=91(x1), r1=222(y1), r2=279(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 222
LDI r2, 279
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
