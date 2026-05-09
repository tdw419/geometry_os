; DESCRIPTION: Renders a green line between points (410, 217) and (137, 181).
; PLAN: r0=410(x1), r1=217(y1), r2=137(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 217
LDI r2, 137
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
