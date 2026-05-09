; DESCRIPTION: Renders a red line between points (269, 247) and (326, 110).
; PLAN: r0=269(x1), r1=247(y1), r2=326(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 247
LDI r2, 326
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
