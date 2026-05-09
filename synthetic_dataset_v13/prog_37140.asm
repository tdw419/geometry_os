; DESCRIPTION: Renders a red line between points (13, 208) and (444, 169).
; PLAN: r0=13(x1), r1=208(y1), r2=444(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 208
LDI r2, 444
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
