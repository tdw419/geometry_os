; DESCRIPTION: Draws a yellow line from (70, 158) to (428, 29).
; PLAN: r0=70(x1), r1=158(y1), r2=428(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 158
LDI r2, 428
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
