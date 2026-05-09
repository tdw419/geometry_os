; DESCRIPTION: Places a purple line segment connecting (21, 71) to (480, 98).
; PLAN: r0=21(x1), r1=71(y1), r2=480(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 71
LDI r2, 480
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
