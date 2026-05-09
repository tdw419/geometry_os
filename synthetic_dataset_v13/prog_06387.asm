; DESCRIPTION: Renders a green line between points (510, 145) and (56, 77).
; PLAN: r0=510(x1), r1=145(y1), r2=56(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 145
LDI r2, 56
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
