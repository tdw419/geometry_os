; DESCRIPTION: Draws a white line from (132, 216) to (428, 70).
; PLAN: r0=132(x1), r1=216(y1), r2=428(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 216
LDI r2, 428
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
