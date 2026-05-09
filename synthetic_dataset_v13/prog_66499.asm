; DESCRIPTION: Renders a yellow line between points (258, 77) and (57, 61).
; PLAN: r0=258(x1), r1=77(y1), r2=57(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 77
LDI r2, 57
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
