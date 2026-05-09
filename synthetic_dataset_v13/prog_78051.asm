; DESCRIPTION: Draws a blue line from (392, 135) to (503, 194).
; PLAN: r0=392(x1), r1=135(y1), r2=503(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 135
LDI r2, 503
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
