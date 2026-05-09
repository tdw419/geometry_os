; DESCRIPTION: Draws a black line from (428, 230) to (367, 99).
; PLAN: r0=428(x1), r1=230(y1), r2=367(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 230
LDI r2, 367
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
