; DESCRIPTION: Renders a red line between points (4, 13) and (15, 7).
; PLAN: r0=4(x1), r1=13(y1), r2=15(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 13
LDI r2, 15
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
