; DESCRIPTION: Draws a purple line from (180, 94) to (152, 150).
; PLAN: r0=180(x1), r1=94(y1), r2=152(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 94
LDI r2, 152
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
