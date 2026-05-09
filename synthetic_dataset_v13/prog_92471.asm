; DESCRIPTION: Draws a blue line from (387, 80) to (395, 208).
; PLAN: r0=387(x1), r1=80(y1), r2=395(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 80
LDI r2, 395
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
