; DESCRIPTION: Renders a blue line between points (401, 198) and (46, 176).
; PLAN: r0=401(x1), r1=198(y1), r2=46(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 198
LDI r2, 46
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
