; DESCRIPTION: Renders a blue line between points (454, 157) and (374, 221).
; PLAN: r0=454(x1), r1=157(y1), r2=374(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 157
LDI r2, 374
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
