; DESCRIPTION: Places a purple line segment connecting (193, 33) to (445, 241).
; PLAN: r0=193(x1), r1=33(y1), r2=445(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 33
LDI r2, 445
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
