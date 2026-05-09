; DESCRIPTION: Renders a red line between points (17, 54) and (44, 221).
; PLAN: r0=17(x1), r1=54(y1), r2=44(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 54
LDI r2, 44
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
