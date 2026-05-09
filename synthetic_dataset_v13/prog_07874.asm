; DESCRIPTION: Renders a red line between points (0, 213) and (97, 110).
; PLAN: r0=0(x1), r1=213(y1), r2=97(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 213
LDI r2, 97
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
