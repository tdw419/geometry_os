; DESCRIPTION: Renders a red line between points (222, 190) and (328, 150).
; PLAN: r0=222(x1), r1=190(y1), r2=328(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 190
LDI r2, 328
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
