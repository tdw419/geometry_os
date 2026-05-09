; DESCRIPTION: Renders a yellow line between points (193, 217) and (24, 60).
; PLAN: r0=193(x1), r1=217(y1), r2=24(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 217
LDI r2, 24
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
