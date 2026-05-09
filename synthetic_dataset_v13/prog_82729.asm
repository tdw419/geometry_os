; DESCRIPTION: Places a purple line segment connecting (95, 98) to (174, 0).
; PLAN: r0=95(x1), r1=98(y1), r2=174(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 98
LDI r2, 174
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
