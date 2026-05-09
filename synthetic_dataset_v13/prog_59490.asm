; DESCRIPTION: Renders a red line between points (312, 20) and (202, 40).
; PLAN: r0=312(x1), r1=20(y1), r2=202(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 20
LDI r2, 202
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
