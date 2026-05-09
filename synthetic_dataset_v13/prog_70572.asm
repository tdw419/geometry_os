; DESCRIPTION: Renders a red line between points (222, 108) and (94, 246).
; PLAN: r0=222(x1), r1=108(y1), r2=94(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 108
LDI r2, 94
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
