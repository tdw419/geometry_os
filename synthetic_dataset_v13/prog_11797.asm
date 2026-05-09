; DESCRIPTION: Renders a red line between points (116, 235) and (255, 91).
; PLAN: r0=116(x1), r1=235(y1), r2=255(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 235
LDI r2, 255
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
