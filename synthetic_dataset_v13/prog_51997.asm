; DESCRIPTION: Draws a blue line from (500, 153) to (171, 220).
; PLAN: r0=500(x1), r1=153(y1), r2=171(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 153
LDI r2, 171
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
