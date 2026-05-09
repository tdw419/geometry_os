; DESCRIPTION: Draws a purple line from (313, 245) to (145, 29).
; PLAN: r0=313(x1), r1=245(y1), r2=145(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 245
LDI r2, 145
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
