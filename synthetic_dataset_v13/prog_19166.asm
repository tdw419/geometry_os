; DESCRIPTION: Renders a yellow line between points (141, 94) and (482, 161).
; PLAN: r0=141(x1), r1=94(y1), r2=482(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 94
LDI r2, 482
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
