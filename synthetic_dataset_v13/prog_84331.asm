; DESCRIPTION: Draws a blue line from (254, 208) to (463, 200).
; PLAN: r0=254(x1), r1=208(y1), r2=463(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 208
LDI r2, 463
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
