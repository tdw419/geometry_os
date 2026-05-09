; DESCRIPTION: Renders a green line between points (4, 3) and (297, 39).
; PLAN: r0=4(x1), r1=3(y1), r2=297(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 3
LDI r2, 297
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
