; DESCRIPTION: Renders a green line between points (359, 1) and (342, 176).
; PLAN: r0=359(x1), r1=1(y1), r2=342(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 1
LDI r2, 342
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
