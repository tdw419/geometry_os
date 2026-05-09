; DESCRIPTION: Renders a red line between points (339, 33) and (270, 208).
; PLAN: r0=339(x1), r1=33(y1), r2=270(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 33
LDI r2, 270
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
