; DESCRIPTION: Draws a blue line from (136, 103) to (110, 117).
; PLAN: r0=136(x1), r1=103(y1), r2=110(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 103
LDI r2, 110
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
