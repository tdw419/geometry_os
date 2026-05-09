; DESCRIPTION: Draws a green line from (216, 216) to (225, 83).
; PLAN: r0=216(x1), r1=216(y1), r2=225(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 216
LDI r2, 225
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
