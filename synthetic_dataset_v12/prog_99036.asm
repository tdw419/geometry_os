; DESCRIPTION: Renders a purple line between points (117, 102) and (84, 207).
; PLAN: r0=117(x1), r1=102(y1), r2=84(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 102
LDI r2, 84
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
