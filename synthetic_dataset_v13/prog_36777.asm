; DESCRIPTION: Draws a purple line from (277, 226) to (50, 38).
; PLAN: r0=277(x1), r1=226(y1), r2=50(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 226
LDI r2, 50
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
