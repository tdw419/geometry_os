; DESCRIPTION: Draws a blue line from (162, 132) to (277, 162).
; PLAN: r0=162(x1), r1=132(y1), r2=277(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 132
LDI r2, 277
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
