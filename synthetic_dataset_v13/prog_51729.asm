; DESCRIPTION: Renders a red line between points (335, 197) and (465, 20).
; PLAN: r0=335(x1), r1=197(y1), r2=465(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 197
LDI r2, 465
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
