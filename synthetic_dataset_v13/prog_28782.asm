; DESCRIPTION: Draws a purple line from (487, 22) to (430, 70).
; PLAN: r0=487(x1), r1=22(y1), r2=430(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 22
LDI r2, 430
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
