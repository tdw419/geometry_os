; DESCRIPTION: Places a purple line segment connecting (4, 129) to (140, 161).
; PLAN: r0=4(x1), r1=129(y1), r2=140(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 129
LDI r2, 140
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
