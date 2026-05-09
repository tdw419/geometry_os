; DESCRIPTION: Renders a green line between points (170, 251) and (33, 17).
; PLAN: r0=170(x1), r1=251(y1), r2=33(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 251
LDI r2, 33
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
