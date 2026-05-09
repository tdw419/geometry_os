; DESCRIPTION: Renders a blue line between points (398, 181) and (439, 99).
; PLAN: r0=398(x1), r1=181(y1), r2=439(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 181
LDI r2, 439
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
