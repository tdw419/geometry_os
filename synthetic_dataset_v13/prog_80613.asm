; DESCRIPTION: Renders a white line between points (54, 231) and (448, 19).
; PLAN: r0=54(x1), r1=231(y1), r2=448(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 231
LDI r2, 448
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
