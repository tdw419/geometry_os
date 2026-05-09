; DESCRIPTION: Renders a red line between points (300, 70) and (494, 17).
; PLAN: r0=300(x1), r1=70(y1), r2=494(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 70
LDI r2, 494
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
