; DESCRIPTION: Draws a black line from (319, 80) to (428, 34).
; PLAN: r0=319(x1), r1=80(y1), r2=428(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 80
LDI r2, 428
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
