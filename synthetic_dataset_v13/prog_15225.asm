; DESCRIPTION: Renders a purple line between points (4, 161) and (218, 46).
; PLAN: r0=4(x1), r1=161(y1), r2=218(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 161
LDI r2, 218
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
