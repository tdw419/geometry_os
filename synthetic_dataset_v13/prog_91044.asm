; DESCRIPTION: Renders a green line between points (150, 250) and (17, 211).
; PLAN: r0=150(x1), r1=250(y1), r2=17(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 250
LDI r2, 17
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
