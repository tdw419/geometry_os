; DESCRIPTION: Draws a blue line from (254, 133) to (186, 60).
; PLAN: r0=254(x1), r1=133(y1), r2=186(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 133
LDI r2, 186
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
