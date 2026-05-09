; DESCRIPTION: Renders a red line between points (417, 46) and (371, 155).
; PLAN: r0=417(x1), r1=46(y1), r2=371(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 46
LDI r2, 371
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
