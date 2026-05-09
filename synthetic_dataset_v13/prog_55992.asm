; DESCRIPTION: Renders a red line between points (160, 134) and (342, 235).
; PLAN: r0=160(x1), r1=134(y1), r2=342(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 134
LDI r2, 342
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
