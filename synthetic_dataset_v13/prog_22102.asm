; DESCRIPTION: Draws a black line from (315, 97) to (148, 131).
; PLAN: r0=315(x1), r1=97(y1), r2=148(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 97
LDI r2, 148
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
