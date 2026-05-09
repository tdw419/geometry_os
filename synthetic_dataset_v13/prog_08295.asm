; DESCRIPTION: Draws a blue line from (80, 178) to (470, 206).
; PLAN: r0=80(x1), r1=178(y1), r2=470(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 178
LDI r2, 470
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
