; DESCRIPTION: Renders a red line between points (500, 116) and (164, 105).
; PLAN: r0=500(x1), r1=116(y1), r2=164(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 116
LDI r2, 164
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
