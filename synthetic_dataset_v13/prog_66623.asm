; DESCRIPTION: Renders a red line between points (225, 248) and (205, 92).
; PLAN: r0=225(x1), r1=248(y1), r2=205(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 248
LDI r2, 205
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
