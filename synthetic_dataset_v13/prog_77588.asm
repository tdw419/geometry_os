; DESCRIPTION: Renders a red line between points (500, 135) and (329, 216).
; PLAN: r0=500(x1), r1=135(y1), r2=329(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 135
LDI r2, 329
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
