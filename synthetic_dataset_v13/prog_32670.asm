; DESCRIPTION: Renders a yellow line between points (5, 226) and (211, 61).
; PLAN: r0=5(x1), r1=226(y1), r2=211(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 226
LDI r2, 211
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
