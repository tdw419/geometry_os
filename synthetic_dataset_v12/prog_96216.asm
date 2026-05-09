; DESCRIPTION: Renders a green line between points (321, 25) and (319, 139).
; PLAN: r0=321(x1), r1=25(y1), r2=319(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 25
LDI r2, 319
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
