; DESCRIPTION: Places a purple line segment connecting (63, 61) to (410, 0).
; PLAN: r0=63(x1), r1=61(y1), r2=410(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 61
LDI r2, 410
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
