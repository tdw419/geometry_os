; DESCRIPTION: Renders a red line between points (492, 39) and (201, 66).
; PLAN: r0=492(x1), r1=39(y1), r2=201(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 39
LDI r2, 201
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
