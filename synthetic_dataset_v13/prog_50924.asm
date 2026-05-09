; DESCRIPTION: Draws a black line from (221, 216) to (279, 91).
; PLAN: r0=221(x1), r1=216(y1), r2=279(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 216
LDI r2, 279
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
