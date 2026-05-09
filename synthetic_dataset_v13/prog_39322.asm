; DESCRIPTION: Renders a red line between points (267, 55) and (458, 251).
; PLAN: r0=267(x1), r1=55(y1), r2=458(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 55
LDI r2, 458
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
