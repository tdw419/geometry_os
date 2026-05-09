; DESCRIPTION: Renders a green line between points (77, 110) and (361, 13).
; PLAN: r0=77(x1), r1=110(y1), r2=361(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 110
LDI r2, 361
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
