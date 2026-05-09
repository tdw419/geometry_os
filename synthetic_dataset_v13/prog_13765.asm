; DESCRIPTION: Draws a purple line from (137, 45) to (154, 216).
; PLAN: r0=137(x1), r1=45(y1), r2=154(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 45
LDI r2, 154
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
