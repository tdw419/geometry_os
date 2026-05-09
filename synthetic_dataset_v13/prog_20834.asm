; DESCRIPTION: Draws a purple line from (303, 219) to (392, 251).
; PLAN: r0=303(x1), r1=219(y1), r2=392(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 219
LDI r2, 392
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
