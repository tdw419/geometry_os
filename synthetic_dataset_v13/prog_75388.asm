; DESCRIPTION: Draws a blue line from (336, 9) to (470, 48).
; PLAN: r0=336(x1), r1=9(y1), r2=470(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 9
LDI r2, 470
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
