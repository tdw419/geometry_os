; DESCRIPTION: Renders a red line between points (243, 22) and (337, 199).
; PLAN: r0=243(x1), r1=22(y1), r2=337(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 22
LDI r2, 337
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
