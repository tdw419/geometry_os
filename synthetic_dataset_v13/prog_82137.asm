; DESCRIPTION: Places a blue line segment connecting (117, 47) to (478, 220).
; PLAN: r0=117(x1), r1=47(y1), r2=478(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 47
LDI r2, 478
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
