; DESCRIPTION: Draws a black line from (388, 188) to (170, 65).
; PLAN: r0=388(x1), r1=188(y1), r2=170(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 188
LDI r2, 170
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
