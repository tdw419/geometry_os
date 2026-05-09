; DESCRIPTION: Places a purple line segment connecting (392, 21) to (72, 86).
; PLAN: r0=392(x1), r1=21(y1), r2=72(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 21
LDI r2, 72
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
