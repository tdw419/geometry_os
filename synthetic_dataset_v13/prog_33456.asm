; DESCRIPTION: Draws a blue line from (20, 185) to (439, 91).
; PLAN: r0=20(x1), r1=185(y1), r2=439(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 185
LDI r2, 439
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
