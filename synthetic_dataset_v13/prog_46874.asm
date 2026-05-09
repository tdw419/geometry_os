; DESCRIPTION: Places a purple line segment connecting (460, 79) to (371, 32).
; PLAN: r0=460(x1), r1=79(y1), r2=371(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 79
LDI r2, 371
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
