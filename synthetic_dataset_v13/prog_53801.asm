; DESCRIPTION: Renders a red line between points (175, 5) and (10, 99).
; PLAN: r0=175(x1), r1=5(y1), r2=10(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 5
LDI r2, 10
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
