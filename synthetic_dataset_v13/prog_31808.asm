; DESCRIPTION: Draws a black line from (54, 0) to (428, 106).
; PLAN: r0=54(x1), r1=0(y1), r2=428(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 0
LDI r2, 428
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
