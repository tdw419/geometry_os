; DESCRIPTION: Renders a red line between points (490, 69) and (251, 160).
; PLAN: r0=490(x1), r1=69(y1), r2=251(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 69
LDI r2, 251
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
