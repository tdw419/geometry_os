; DESCRIPTION: Renders a red line between points (44, 249) and (70, 205).
; PLAN: r0=44(x1), r1=249(y1), r2=70(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 249
LDI r2, 70
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
