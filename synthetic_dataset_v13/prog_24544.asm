; DESCRIPTION: Renders a yellow line between points (165, 87) and (301, 31).
; PLAN: r0=165(x1), r1=87(y1), r2=301(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 87
LDI r2, 301
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
