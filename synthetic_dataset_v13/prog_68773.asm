; DESCRIPTION: Places a purple line segment connecting (340, 85) to (90, 82).
; PLAN: r0=340(x1), r1=85(y1), r2=90(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 85
LDI r2, 90
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
