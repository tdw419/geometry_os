; DESCRIPTION: Places a purple line segment connecting (125, 39) to (75, 102).
; PLAN: r0=125(x1), r1=39(y1), r2=75(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 39
LDI r2, 75
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
