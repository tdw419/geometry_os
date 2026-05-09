; DESCRIPTION: Draws a white line from (355, 111) to (216, 136).
; PLAN: r0=355(x1), r1=111(y1), r2=216(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 111
LDI r2, 216
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
