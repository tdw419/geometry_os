; DESCRIPTION: Renders a yellow line between points (68, 229) and (185, 30).
; PLAN: r0=68(x1), r1=229(y1), r2=185(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 229
LDI r2, 185
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
