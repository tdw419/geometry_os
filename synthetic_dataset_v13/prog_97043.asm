; DESCRIPTION: Renders a yellow line between points (248, 96) and (280, 119).
; PLAN: r0=248(x1), r1=96(y1), r2=280(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 96
LDI r2, 280
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
