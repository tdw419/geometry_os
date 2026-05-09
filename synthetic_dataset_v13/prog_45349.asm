; DESCRIPTION: Places a purple line segment connecting (38, 73) to (467, 91).
; PLAN: r0=38(x1), r1=73(y1), r2=467(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 73
LDI r2, 467
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
