; DESCRIPTION: Renders a green line between points (198, 94) and (80, 106).
; PLAN: r0=198(x1), r1=94(y1), r2=80(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 94
LDI r2, 80
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
