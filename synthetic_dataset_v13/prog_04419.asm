; DESCRIPTION: Renders a green line between points (147, 77) and (410, 72).
; PLAN: r0=147(x1), r1=77(y1), r2=410(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 77
LDI r2, 410
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
