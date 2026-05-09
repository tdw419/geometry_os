; DESCRIPTION: Renders a red line between points (61, 44) and (391, 11).
; PLAN: r0=61(x1), r1=44(y1), r2=391(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 44
LDI r2, 391
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
