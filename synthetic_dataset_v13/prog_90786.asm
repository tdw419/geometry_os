; DESCRIPTION: Renders a yellow line between points (160, 216) and (35, 170).
; PLAN: r0=160(x1), r1=216(y1), r2=35(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 216
LDI r2, 35
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
