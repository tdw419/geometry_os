; DESCRIPTION: Renders a yellow line between points (389, 231) and (285, 202).
; PLAN: r0=389(x1), r1=231(y1), r2=285(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 231
LDI r2, 285
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
