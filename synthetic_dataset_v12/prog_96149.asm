; DESCRIPTION: Renders a red line between points (367, 133) and (510, 148).
; PLAN: r0=367(x1), r1=133(y1), r2=510(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 133
LDI r2, 510
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
