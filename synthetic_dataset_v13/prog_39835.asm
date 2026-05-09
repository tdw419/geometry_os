; DESCRIPTION: Draws a green line from (270, 216) to (247, 49).
; PLAN: r0=270(x1), r1=216(y1), r2=247(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 216
LDI r2, 247
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
