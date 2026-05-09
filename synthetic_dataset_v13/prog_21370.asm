; DESCRIPTION: Draws a blue line from (385, 145) to (284, 152).
; PLAN: r0=385(x1), r1=145(y1), r2=284(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 145
LDI r2, 284
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
