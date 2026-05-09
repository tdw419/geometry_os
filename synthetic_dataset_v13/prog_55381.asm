; DESCRIPTION: Draws a purple line from (480, 75) to (56, 23).
; PLAN: r0=480(x1), r1=75(y1), r2=56(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 75
LDI r2, 56
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
