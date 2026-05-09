; DESCRIPTION: Renders a red line between points (359, 133) and (235, 205).
; PLAN: r0=359(x1), r1=133(y1), r2=235(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 133
LDI r2, 235
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
