; DESCRIPTION: Draws a purple line from (186, 175) to (392, 69).
; PLAN: r0=186(x1), r1=175(y1), r2=392(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 175
LDI r2, 392
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
