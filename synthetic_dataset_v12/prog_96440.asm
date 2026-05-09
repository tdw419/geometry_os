; DESCRIPTION: Places a purple line segment connecting (71, 45) to (171, 243).
; PLAN: r0=71(x1), r1=45(y1), r2=171(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 45
LDI r2, 171
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
