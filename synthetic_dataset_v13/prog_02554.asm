; DESCRIPTION: Renders a green line between points (202, 84) and (15, 211).
; PLAN: r0=202(x1), r1=84(y1), r2=15(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 84
LDI r2, 15
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
