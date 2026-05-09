; DESCRIPTION: Draws a yellow line from (185, 71) to (216, 142).
; PLAN: r0=185(x1), r1=71(y1), r2=216(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 71
LDI r2, 216
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
