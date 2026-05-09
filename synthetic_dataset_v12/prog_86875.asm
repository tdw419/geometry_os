; DESCRIPTION: Renders a blue line between points (153, 33) and (374, 206).
; PLAN: r0=153(x1), r1=33(y1), r2=374(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 33
LDI r2, 374
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
