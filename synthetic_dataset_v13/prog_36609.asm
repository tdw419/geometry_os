; DESCRIPTION: Renders a green line between points (175, 51) and (83, 211).
; PLAN: r0=175(x1), r1=51(y1), r2=83(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 51
LDI r2, 83
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
