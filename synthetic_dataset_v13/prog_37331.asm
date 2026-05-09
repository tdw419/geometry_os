; DESCRIPTION: Places a purple line segment connecting (27, 83) to (140, 236).
; PLAN: r0=27(x1), r1=83(y1), r2=140(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 83
LDI r2, 140
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
