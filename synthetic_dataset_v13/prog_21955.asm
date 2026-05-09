; DESCRIPTION: Renders a blue line between points (90, 22) and (433, 241).
; PLAN: r0=90(x1), r1=22(y1), r2=433(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 22
LDI r2, 433
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
