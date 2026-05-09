; DESCRIPTION: Renders a red line between points (56, 222) and (395, 75).
; PLAN: r0=56(x1), r1=222(y1), r2=395(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 222
LDI r2, 395
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
