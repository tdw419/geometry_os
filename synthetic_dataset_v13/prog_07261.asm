; DESCRIPTION: Draws a purple line from (392, 85) to (398, 101).
; PLAN: r0=392(x1), r1=85(y1), r2=398(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 85
LDI r2, 398
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
