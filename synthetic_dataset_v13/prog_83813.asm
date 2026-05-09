; DESCRIPTION: Draws a magenta line from (110, 216) to (402, 36).
; PLAN: r0=110(x1), r1=216(y1), r2=402(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 216
LDI r2, 402
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
