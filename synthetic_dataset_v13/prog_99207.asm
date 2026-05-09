; DESCRIPTION: Renders a red line between points (44, 110) and (181, 213).
; PLAN: r0=44(x1), r1=110(y1), r2=181(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 110
LDI r2, 181
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
