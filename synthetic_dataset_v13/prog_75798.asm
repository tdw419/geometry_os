; DESCRIPTION: Draws a blue line from (327, 132) to (500, 117).
; PLAN: r0=327(x1), r1=132(y1), r2=500(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 132
LDI r2, 500
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
