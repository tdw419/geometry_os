; DESCRIPTION: Renders a red line between points (140, 124) and (144, 179).
; PLAN: r0=140(x1), r1=124(y1), r2=144(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 124
LDI r2, 144
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
