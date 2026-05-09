; DESCRIPTION: Renders a red line between points (490, 19) and (174, 184).
; PLAN: r0=490(x1), r1=19(y1), r2=174(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 19
LDI r2, 174
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
