; DESCRIPTION: Places a purple line segment connecting (445, 171) to (508, 193).
; PLAN: r0=445(x1), r1=171(y1), r2=508(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 171
LDI r2, 508
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
