; DESCRIPTION: Renders a yellow line between points (342, 46) and (500, 119).
; PLAN: r0=342(x1), r1=46(y1), r2=500(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 46
LDI r2, 500
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
