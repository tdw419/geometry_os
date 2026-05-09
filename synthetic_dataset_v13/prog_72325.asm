; DESCRIPTION: Places a purple line segment connecting (94, 124) to (140, 27).
; PLAN: r0=94(x1), r1=124(y1), r2=140(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 124
LDI r2, 140
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
