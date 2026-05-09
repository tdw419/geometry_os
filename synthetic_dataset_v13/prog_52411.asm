; DESCRIPTION: Renders a yellow line between points (389, 205) and (176, 9).
; PLAN: r0=389(x1), r1=205(y1), r2=176(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 205
LDI r2, 176
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
