; DESCRIPTION: Draws a yellow line from (216, 245) to (449, 46).
; PLAN: r0=216(x1), r1=245(y1), r2=449(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 245
LDI r2, 449
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
