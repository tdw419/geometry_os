; DESCRIPTION: Places a purple line segment connecting (480, 82) to (72, 71).
; PLAN: r0=480(x1), r1=82(y1), r2=72(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 82
LDI r2, 72
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
