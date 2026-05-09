; DESCRIPTION: Renders a yellow line between points (83, 74) and (54, 234).
; PLAN: r0=83(x1), r1=74(y1), r2=54(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 74
LDI r2, 54
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
