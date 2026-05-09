; DESCRIPTION: Renders a red line between points (37, 150) and (255, 118).
; PLAN: r0=37(x1), r1=150(y1), r2=255(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 150
LDI r2, 255
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
