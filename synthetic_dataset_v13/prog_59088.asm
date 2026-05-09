; DESCRIPTION: Places a purple line segment connecting (91, 82) to (180, 15).
; PLAN: r0=91(x1), r1=82(y1), r2=180(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 82
LDI r2, 180
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
