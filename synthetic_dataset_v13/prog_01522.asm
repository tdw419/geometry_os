; DESCRIPTION: Renders a red line between points (68, 108) and (457, 207).
; PLAN: r0=68(x1), r1=108(y1), r2=457(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 108
LDI r2, 457
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
