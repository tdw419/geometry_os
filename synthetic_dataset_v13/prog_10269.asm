; DESCRIPTION: Draws a black line from (90, 170) to (359, 44).
; PLAN: r0=90(x1), r1=170(y1), r2=359(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 170
LDI r2, 359
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
