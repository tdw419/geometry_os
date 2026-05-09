; DESCRIPTION: Renders a yellow line between points (35, 65) and (417, 120).
; PLAN: r0=35(x1), r1=65(y1), r2=417(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 65
LDI r2, 417
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
