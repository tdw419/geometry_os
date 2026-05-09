; DESCRIPTION: Draws a purple line from (398, 21) to (360, 216).
; PLAN: r0=398(x1), r1=21(y1), r2=360(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 21
LDI r2, 360
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
