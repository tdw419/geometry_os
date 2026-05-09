; DESCRIPTION: Draws a blue line from (489, 139) to (275, 132).
; PLAN: r0=489(x1), r1=139(y1), r2=275(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 139
LDI r2, 275
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
