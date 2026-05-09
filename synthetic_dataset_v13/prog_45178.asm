; DESCRIPTION: Places a purple line segment connecting (210, 237) to (83, 225).
; PLAN: r0=210(x1), r1=237(y1), r2=83(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 237
LDI r2, 83
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
