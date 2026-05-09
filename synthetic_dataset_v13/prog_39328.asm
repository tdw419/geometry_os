; DESCRIPTION: Places a purple line segment connecting (460, 146) to (72, 30).
; PLAN: r0=460(x1), r1=146(y1), r2=72(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 146
LDI r2, 72
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
