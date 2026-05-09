; DESCRIPTION: Renders a green line between points (470, 120) and (155, 168).
; PLAN: r0=470(x1), r1=120(y1), r2=155(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 120
LDI r2, 155
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
