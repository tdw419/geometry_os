; DESCRIPTION: Renders a green line between points (99, 7) and (98, 251).
; PLAN: r0=99(x1), r1=7(y1), r2=98(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 7
LDI r2, 98
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
