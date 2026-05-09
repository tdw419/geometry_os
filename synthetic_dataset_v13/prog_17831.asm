; DESCRIPTION: Renders a red line between points (490, 69) and (447, 235).
; PLAN: r0=490(x1), r1=69(y1), r2=447(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 69
LDI r2, 447
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
