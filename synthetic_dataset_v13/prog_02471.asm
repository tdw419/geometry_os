; DESCRIPTION: Places a purple line segment connecting (164, 143) to (493, 150).
; PLAN: r0=164(x1), r1=143(y1), r2=493(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 143
LDI r2, 493
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
