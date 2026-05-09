; DESCRIPTION: Renders a red line between points (106, 23) and (204, 236).
; PLAN: r0=106(x1), r1=23(y1), r2=204(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 23
LDI r2, 204
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
