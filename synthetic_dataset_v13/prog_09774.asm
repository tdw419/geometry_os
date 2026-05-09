; DESCRIPTION: Renders a green line between points (391, 17) and (77, 9).
; PLAN: r0=391(x1), r1=17(y1), r2=77(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 17
LDI r2, 77
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
