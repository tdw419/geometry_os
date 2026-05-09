; DESCRIPTION: Renders a yellow line between points (230, 201) and (485, 139).
; PLAN: r0=230(x1), r1=201(y1), r2=485(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 201
LDI r2, 485
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
