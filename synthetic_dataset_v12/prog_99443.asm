; DESCRIPTION: Renders a red line between points (391, 16) and (3, 75).
; PLAN: r0=391(x1), r1=16(y1), r2=3(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 16
LDI r2, 3
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
