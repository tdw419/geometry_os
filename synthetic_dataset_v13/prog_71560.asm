; DESCRIPTION: Draws a green line from (20, 232) to (355, 160).
; PLAN: r0=20(x1), r1=232(y1), r2=355(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 232
LDI r2, 355
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
