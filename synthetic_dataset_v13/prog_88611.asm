; DESCRIPTION: Places a purple line segment connecting (82, 98) to (72, 127).
; PLAN: r0=82(x1), r1=98(y1), r2=72(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 98
LDI r2, 72
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
